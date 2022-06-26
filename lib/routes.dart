import 'package:flutter/widgets.dart';
import 'views/login_view/login_view.dart';
import 'views/register_view/register_view.dart';
import 'views/reset_pass_view/reset_pass_view.dart';
import 'views/splash_view/splash_view.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashView.routeName: (context) => const SplashView(),
  LoginView.routeName: (context) => LoginView(),
  RegisterView.routeName: (context) => RegisterView(),
  ResetPassView.routeName: (context) => ResetPassView(),
};
