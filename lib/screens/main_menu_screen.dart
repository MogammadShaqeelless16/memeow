
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:memeow/widgets/menu_button.dart';

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
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .shimmer(
                      delay: 2000.ms,
                      duration: 1500.ms,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    )
                    .then(delay: 5000.ms), // Wait 5s before repeating
                const SizedBox(height: 10),
                Text(
                  'The Cat Meme Reaction Game',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ).animate().fade(delay: 300.ms, duration: 500.ms).slideY(begin: 1, end: 0),
                const SizedBox(height: 50),
                // Menu Buttons
                ...[
                  MenuButton(
                    text: 'Paws & Play',
                    icon: Icons.pets,
                    onPressed: () => context.go('/game'),
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: 'How to Play',
                    icon: Icons.help_outline,
                    onPressed: () => context.go('/how-to-play'),
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: 'Settings',
                    icon: Icons.settings,
                    onPressed: () => context.go('/settings'),
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: 'About',
                    icon: Icons.info_outline,
                    onPressed: () => context.go('/about'),
                  ),
                ].animate(interval: 100.ms).fade(duration: 300.ms).slideX(begin: -1, end: 0),
                const Spacer(),
                // Footer Text
                Text(
                  'React with the purr-fect meme!',
                  style: Theme.of(context).textTheme.bodySmall,
                ).animate().fade(delay: 800.ms, duration: 500.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
