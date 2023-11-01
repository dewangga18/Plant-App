import 'package:flutter/widgets.dart';
import 'package:plant_app/views/screens/dashboard.dart';
import 'package:plant_app/views/screens/detail.dart';
import 'package:plant_app/views/screens/welcome.dart';

abstract class AppRoute {
  static const String welcome = '/welcome';
  static const String dashboard = '/dashboard';
  static const String detail = '/detail';
  
  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      welcome: (context) => const WelcomeScreen(),
      dashboard: (context) => const DashboardScreen(),
      detail: (context) => const DetailScreen(),
    };
  }
}
