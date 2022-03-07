import 'package:flutter/material.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hodl',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      onGenerateRoute: AppRouter.onGenerated,
      home: const SplashScreen()
    );
  }
}

