import 'package:flutter/material.dart';
import 'package:job_search/resources/route_generator.dart';
import 'package:job_search/ui/splash/splash_view.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: SplashView.routeName,
      // theme: ,
    );
  }
}
