import 'package:flutter/material.dart';
import 'package:login_app/data/notifiers.dart';
import 'pages/splash/splash_app.dart';
import 'theme/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isUsingDarkTheme,
        builder: (context, isDark, _) {
          return MaterialApp(
            title: 'Flutter Demo App',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
