import 'package:web3dart/web3dart.dart'; import 'package:flutter/foundation.dart'; import 'package:bip39/bip39.dart' as bip39; import 'package:ed25519_hd_key/ed25519_hd_key.dart'; import 'package:hex/hex.dart'; import 'package:shared_preferences/shared_preferences.dart'; import 'package:http/http.dart'; // For HTTP client

abstract class WalletAddressService { String generateMnemonic(); Future<String> getPrivateKey(String mnemonic); Future<EthereumAddress> getPublicKey(String privateKey); }

enum Network { ethereum, polygon }

class WalletProvider extends ChangeNotifier implements WalletAddressService { String? privateKey;

Network selectedNetwork = Network.ethereum;

Map<Network, String> rpcUrls = { Network.ethereum: 'https://mainnet.infura.io/v3/YOUR_INFURA_KEY', Network.polygon: 'https://polygon-rpc.com', };

Map<Network, String> usdcAddresses = { Network.ethereum: '0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48', Network.polygon: '0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174', };

Map<Network, int> chainIds = { Network.ethereum: 1, Network.polygon: 137, };

String get rpcUrl => rpcUrls[selectedNetwork]!; String get usdcContractAddress => usdcAddresses[selectedNetwork]!; int get chainId => chainIds[selectedNetwork]!;

String usdcAbi = ''' [ { "constant": true, "inputs": [{"name": "owner", "type": "address"}], "name": "balanceOf", "outputs": [{"name": "", "type": "uint256"}], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [ {"name": "to", "type": "address"}, {"name": "value", "type": "uint256"} ], "name": "transfer", "outputs": [{"name": "", "type": "bool"}], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{"name": "", "type": "uint8"}], "payable": false, "stateMutability": "view", "type": "function" } ] ''';

Web3Client _getClient() { return Web3Client(rpcUrl, Client()); }

Future<void> loadPrivateKey() async { SharedPreferences prefs = await SharedPreferences.getInstance(); privateKey = prefs.getString('privateKey'); }

Future<void> setPrivateKey(String privateKey) async { SharedPreferences prefs = await SharedPreferences.getInstance(); await prefs.setString('privateKey', privateKey); this.privateKey = privateKey; notifyListeners(); }

void switchNetwork(Network network) { selectedNetwork = network; notifyListeners(); }

@override String generateMnemonic() { return bip39.generateMnemonic(); }

@override Future<String> getPrivateKey(String mnemonic) async { final seed = bip39.mnemonicToSeed(mnemonic); final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed); final privateKey = HEX.encode(master.key); await setPrivateKey(privateKey); return privateKey; }

@override Future<EthereumAddress> getPublicKey(String privateKey) async { final private = EthPrivateKey.fromHex(privateKey); final address = await private.address; return address; }

DeployedContract _getUSDCContract() { return DeployedContract( ContractAbi.fromJson(usdcAbi, 'USDC'), EthereumAddress.fromHex(usdcContractAddress), ); }

Future<int> getUSDCDecimals() async { final client = _getClient(); final contract = _getUSDCContract(); final decimalsFunction = contract.function('decimals'); try { final result = await client.call( contract: contract, function: decimalsFunction, params: [], ); await client.dispose(); return (result.first as BigInt).toInt(); } catch (e) { print('Error getting USDC decimals: $e'); await client.dispose(); return 6; } }

Future<BigInt> getUSDCBalance() async { if (privateKey == null) throw Exception('Private key not loaded'); final client = _getClient(); final contract = _getUSDCContract(); final balanceFunction = contract.function('balanceOf'); try { final address = await getPublicKey(privateKey!); final result = await client.call( contract: contract, function: balanceFunction, params: [address], ); await client.dispose(); return result.first as BigInt; } catch (e) { print('Error getting USDC balance: $e'); await client.dispose(); rethrow; } }

Future<double> getFormattedUSDCBalance() async { final balance = await getUSDCBalance(); final decimals = await getUSDCDecimals(); return balance.toDouble() / BigInt.from(10).pow(decimals).toDouble(); }

Future<String> transferUSDC(String toAddress, double amount) async { if (privateKey == null) throw Exception('Private key not loaded'); final client = _getClient(); final contract = _getUSDCContract(); final transferFunction = contract.function('transfer'); try { final credentials = EthPrivateKey.fromHex(privateKey!); final decimals = await getUSDCDecimals(); final rawAmount = BigInt.from(amount * BigInt.from(10).pow(decimals).toDouble()); final transaction = Transaction.callContract( contract: contract, function: transferFunction, parameters: [ EthereumAddress.fromHex(toAddress), rawAmount ], ); final txHash = await client.sendTransaction( credentials, transaction, chainId: chainId, ); await client.dispose(); return txHash; } catch (e) { print('Error transferring USDC: $e'); await client.dispose(); rethrow; } }

Future<bool> isTransactionConfirmed(String txHash) async { final client = _getClient(); try { final receipt = await client.getTransactionReceipt(txHash); await client.dispose(); return receipt != null && receipt.status!; } catch (e) { print('Error checking transaction status: $e'); await client.dispose(); return false; } }

Stream<FilterEvent> listenForIncomingUSDC() async* { if (privateKey == null) throw Exception('Private key not loaded'); final client = _getClient(); final address = await getPublicKey(privateKey!); try { final filter = FilterOptions( fromBlock: BlockNum.current(), toBlock: BlockNum.pending, address: EthereumAddress.fromHex(usdcContractAddress), topics: [ [ '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef' ], null, ['0x000000000000000000000000${address.hex.substring(2)}'] ], ); yield* client.events(filter); } catch (e) { print('Error listening for incoming USDC: $e'); await client.dispose(); } }

bool isValidEthereumAddress(String address) { if (!address.startsWith('0x')) return false; if (address.length != 42) return false; return RegExp(r'^0x[0-9a-fA-F]{40}$').hasMatch(address); }

void dispose() { super.dispose(); } }

