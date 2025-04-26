import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: RegisterAccountWidget.routeName,
          path: RegisterAccountWidget.routePath,
          builder: (context, params) => RegisterAccountWidget(),
        ),
        FFRoute(
          name: CompleteProfileWidget.routeName,
          path: CompleteProfileWidget.routePath,
          builder: (context, params) => CompleteProfileWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: NotificationsSettingsWidget.routeName,
          path: NotificationsSettingsWidget.routePath,
          builder: (context, params) => NotificationsSettingsWidget(),
        ),
        FFRoute(
          name: SecurityPrivacyPolicyWidget.routeName,
          path: SecurityPrivacyPolicyWidget.routePath,
          builder: (context, params) => SecurityPrivacyPolicyWidget(),
        ),
        FFRoute(
          name: BillsWidget.routeName,
          path: BillsWidget.routePath,
          builder: (context, params) => BillsWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Home')
              : NavBarPage(
                  initialPage: 'Home',
                  page: HomeWidget(),
                ),
        ),
        FFRoute(
          name: MySubcriptionsAccountWidget.routeName,
          path: MySubcriptionsAccountWidget.routePath,
          builder: (context, params) => MySubcriptionsAccountWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PaymentWidget(),
          ),
        ),
        FFRoute(
          name: CriptoWidget.routeName,
          path: CriptoWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CriptoWidget(),
          ),
        ),
        FFRoute(
          name: MenuWidget.routeName,
          path: MenuWidget.routePath,
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: EditprofileWidget.routeName,
          path: EditprofileWidget.routePath,
          builder: (context, params) => EditprofileWidget(),
        ),
        FFRoute(
          name: Details39TransactionTransferResponsiveWidget.routeName,
          path: Details39TransactionTransferResponsiveWidget.routePath,
          builder: (context, params) =>
              Details39TransactionTransferResponsiveWidget(),
        ),
        FFRoute(
          name: TransactionWidget.routeName,
          path: TransactionWidget.routePath,
          builder: (context, params) => TransactionWidget(),
        ),
        FFRoute(
          name: SupportPageWidget.routeName,
          path: SupportPageWidget.routePath,
          builder: (context, params) => SupportPageWidget(),
        ),
        FFRoute(
          name: InvoicesWidget.routeName,
          path: InvoicesWidget.routePath,
          builder: (context, params) => InvoicesWidget(),
        ),
        FFRoute(
          name: PhoneNumberrequestWidget.routeName,
          path: PhoneNumberrequestWidget.routePath,
          builder: (context, params) => PhoneNumberrequestWidget(),
        ),
        FFRoute(
          name: PhonenumberverficationWidget.routeName,
          path: PhonenumberverficationWidget.routePath,
          builder: (context, params) => PhonenumberverficationWidget(),
        ),
        FFRoute(
          name: FundraiserWidget.routeName,
          path: FundraiserWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Fundraiser')
              : FundraiserWidget(),
        ),
        FFRoute(
          name: ChartsWidget.routeName,
          path: ChartsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Charts')
              : ChartsWidget(),
        ),
        FFRoute(
          name: MiniAppsWidget.routeName,
          path: MiniAppsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'miniApps')
              : NavBarPage(
                  initialPage: 'miniApps',
                  page: MiniAppsWidget(),
                ),
        ),
        FFRoute(
          name: CriptomarketWidget.routeName,
          path: CriptomarketWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CriptomarketWidget(),
          ),
        ),
        FFRoute(
          name: BettingMarketWidget.routeName,
          path: BettingMarketWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BettingMarketWidget(),
          ),
        ),
        FFRoute(
          name: AffiliateWidget.routeName,
          path: AffiliateWidget.routePath,
          builder: (context, params) => AffiliateWidget(),
        ),
        FFRoute(
          name: PaylaterWidget.routeName,
          path: PaylaterWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PaylaterWidget(),
          ),
        ),
        FFRoute(
          name: WalletWidget.routeName,
          path: WalletWidget.routePath,
          requireAuth: true,
          builder: (context, params) => WalletWidget(),
        ),
        FFRoute(
          name: LinkyourbankaccountWidget.routeName,
          path: LinkyourbankaccountWidget.routePath,
          builder: (context, params) => LinkyourbankaccountWidget(),
        ),
        FFRoute(
          name: MoonCreditcardWidget.routeName,
          path: MoonCreditcardWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MoonCreditcardWidget(),
        ),
        FFRoute(
          name: CreatemooncardWidget.routeName,
          path: CreatemooncardWidget.routePath,
          builder: (context, params) => CreatemooncardWidget(),
        ),
        FFRoute(
          name: MooncreditcardinfoWidget.routeName,
          path: MooncreditcardinfoWidget.routePath,
          builder: (context, params) => MooncreditcardinfoWidget(),
        ),
        FFRoute(
          name: MooncreditcardaddressWidget.routeName,
          path: MooncreditcardaddressWidget.routePath,
          builder: (context, params) => MooncreditcardaddressWidget(),
        ),
        FFRoute(
          name: MooncreditcardverifyWidget.routeName,
          path: MooncreditcardverifyWidget.routePath,
          builder: (context, params) => MooncreditcardverifyWidget(),
        ),
        FFRoute(
          name: MooncreditcardincomeWidget.routeName,
          path: MooncreditcardincomeWidget.routePath,
          builder: (context, params) => MooncreditcardincomeWidget(),
        ),
        FFRoute(
          name: MooncreditcardtermsandconditionWidget.routeName,
          path: MooncreditcardtermsandconditionWidget.routePath,
          builder: (context, params) => MooncreditcardtermsandconditionWidget(),
        ),
        FFRoute(
          name: QRcodeWidget.routeName,
          path: QRcodeWidget.routePath,
          builder: (context, params) => QRcodeWidget(),
        ),
        FFRoute(
          name: NetbalanceWidget.routeName,
          path: NetbalanceWidget.routePath,
          builder: (context, params) => NetbalanceWidget(),
        ),
        FFRoute(
          name: TransactiondetailsWidget.routeName,
          path: TransactiondetailsWidget.routePath,
          builder: (context, params) => TransactiondetailsWidget(),
        ),
        FFRoute(
          name: WithdrawWidget.routeName,
          path: WithdrawWidget.routePath,
          builder: (context, params) => WithdrawWidget(),
        ),
        FFRoute(
          name: AllcardsWidget.routeName,
          path: AllcardsWidget.routePath,
          builder: (context, params) => AllcardsWidget(),
        ),
        FFRoute(
          name: LoansWidget.routeName,
          path: LoansWidget.routePath,
          builder: (context, params) => LoansWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: SavingAccountWidget.routeName,
          path: SavingAccountWidget.routePath,
          builder: (context, params) => SavingAccountWidget(),
        ),
        FFRoute(
          name: HomescreenWidget.routeName,
          path: HomescreenWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: HomescreenWidget(),
          ),
        ),
        FFRoute(
          name: MenumoonWidget.routeName,
          path: MenumoonWidget.routePath,
          builder: (context, params) => MenumoonWidget(),
        ),
        FFRoute(
          name: BuyUSDCWidget.routeName,
          path: BuyUSDCWidget.routePath,
          builder: (context, params) => BuyUSDCWidget(),
        ),
        FFRoute(
          name: ReviewoderWidget.routeName,
          path: ReviewoderWidget.routePath,
          builder: (context, params) => ReviewoderWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/photo_2025-03-13_23.38.57.jpeg',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
