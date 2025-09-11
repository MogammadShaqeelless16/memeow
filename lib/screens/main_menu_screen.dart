
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:memeow/widgets/menu_button.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  late AudioPlayer _audioPlayer;
  bool _isMusicPlaying = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playRandomIntro();
  }

  void _playRandomIntro() async {
    final random = Random();
    final trackNumber = random.nextInt(4) + 1;
    await _audioPlayer.play(AssetSource('audio/intro_track_$trackNumber.mp3'));
    _audioPlayer.onPlayerComplete.listen((event) {
      _playRandomIntro();
    });
  }

  void _toggleMusic() {
    if (_isMusicPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    setState(() {
      _isMusicPlaying = !_isMusicPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

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
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/gifs/main_menu.gif'),
                ),
                const SizedBox(height: 10),
                Text(
                  'The Kitty Meme Scenario Game',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ).animate().fade(delay: 300.ms, duration: 500.ms).slideY(begin: 1, end: 0),
                const SizedBox(height: 50),
                // Menu Buttons
                ...[
                  MenuButton(
                    text: 'Match the Meme',
                    icon: Icons.style, // Changed icon for relevance
                    onPressed: () => context.go('/game'),
                  ),
                  const SizedBox(height: 20),
                   MenuButton(
                    text: 'Meme Collection',
                    icon: Icons.collections,
                    onPressed: () => context.go('/collection'),
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
                IconButton(
                  icon: Icon(_isMusicPlaying ? Icons.music_note : Icons.music_off),
                  onPressed: _toggleMusic,
                ),
                // Footer Text
                Text(
                  'Create the purr-fect scene!',
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
