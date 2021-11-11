import 'package:get/get.dart';
import 'package:loginexample/bindings/auth_binding.dart';
import 'package:loginexample/bindings/login_binding.dart';
import 'package:loginexample/screens/dashboard/dashboard_screen.dart';
import 'package:loginexample/screens/login/login_screen.dart';
import 'package:loginexample/screens/splash/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static final routes = [
    GetPage(
        name: RoutingNameConstants.SPLASH_SCREEN_ROUTE,
        page: () => SplashScreen(),
        binding: AuthBinding()),
    GetPage(
        name: RoutingNameConstants.LOGIN_SCREEN_ROUTE,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: RoutingNameConstants.DASHBOARD_SCREEN_ROUTE,
        page: () => DashboardScreen())
  ];
}

class RoutingNameConstants {
  static String SPLASH_SCREEN_ROUTE = "/splash_screen";
  static String LOGIN_SCREEN_ROUTE = "/login_screen";
  static String DASHBOARD_SCREEN_ROUTE = "/dashboard_screen";
}
