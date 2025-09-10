import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/app_theme.dart';
import 'package:myapp/screens/main_menu_screen.dart';
import 'package:myapp/screens/how_to_play_screen.dart';
import 'package:myapp/screens/settings_screen.dart';
import 'package:myapp/screens/about_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Memeow',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const MainMenuScreen(),
            '/how-to-play': (context) => const HowToPlayScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/about': (context) => const AboutScreen(),
          },
        );
      },
    );
  }
}
