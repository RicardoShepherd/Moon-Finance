// Suggested code may be subject to a license. Learn more: ~LicenseLog:1310577531.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _NavOpen = prefs.getBool('ff_NavOpen') ?? false;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _NavOpen = false;
  bool get NavOpen => _NavOpen;
  set NavOpen(bool value) {
    _NavOpen = value;
    prefs.setBool('ff_NavOpen', value);
  }

  /// Payment amount when transfering money
  String _Amount = '';
  String get Amount => _Amount;
  set Amount(String value) {
    _Amount = value;
  }
}

/// The problem is that this helper method `_safeInitAsync` is not actually used
/// anywhere in the provided code.
void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

