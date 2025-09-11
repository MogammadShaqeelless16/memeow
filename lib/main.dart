
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:memeow/app_theme.dart';
import 'package:memeow/screens/main_menu_screen.dart';
import 'package:memeow/screens/how_to_play_screen.dart';
import 'package:memeow/screens/settings_screen.dart';
import 'package:memeow/screens/about_screen.dart';
import 'package:memeow/screens/game_screen.dart';
import 'package:memeow/screens/meme_collection_screen.dart';

// Router configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => const GameScreen(),
    ),
    GoRoute(
      path: '/collection',
      builder: (context, state) => const MemeCollectionScreen(),
    ),
    GoRoute(
      path: '/how-to-play',
      builder: (context, state) => const HowToPlayScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);

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
        return MaterialApp.router(
          title: 'Memeow',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: _router,
        );
      },
    );
  }
}
