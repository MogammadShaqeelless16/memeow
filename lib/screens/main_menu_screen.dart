import 'package:flutter/material.dart';
import 'package:myapp/widgets/menu_button.dart'; // We'll create this next

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Title/Logo
                Text(
                  'MEMEOW',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'The Cat Meme Reaction Game',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                // Play Button
                MenuButton(
                  text: 'Paws & Play',
                  icon: Icons.pets,
                  onPressed: () => Navigator.pushNamed(context, '/game'),
                ),
                const SizedBox(height: 20),
                // How to Play Button
                MenuButton(
                  text: 'How to Play',
                  icon: Icons.help_outline,
                  onPressed: () => Navigator.pushNamed(context, '/how-to-play'),
                ),
                const SizedBox(height: 20),
                // Settings Button
                MenuButton(
                  text: 'Settings',
                  icon: Icons.settings,
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
                const SizedBox(height: 20),
                // About Button
                MenuButton(
                  text: 'About',
                  icon: Icons.info_outline,
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                ),
                const Spacer(),
                // Footer Text
                Text(
                  'React with the purr-fect meme!',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}