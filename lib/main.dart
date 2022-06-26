import 'package:arcade_blog/routes.dart';
import 'package:arcade_blog/theme.dart';
import 'package:arcade_blog/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      //home: const SplashView(),

      initialRoute: SplashView.routeName,
      routes: routes,
    );
  }
}
