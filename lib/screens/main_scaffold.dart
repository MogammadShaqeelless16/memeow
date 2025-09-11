import 'package:flutter/material.dart';
import 'package:memeow/screens/meme_collection_screen.dart';
import 'package:memeow/screens/how_to_play_screen.dart';
import 'package:memeow/screens/settings_screen.dart';
import 'package:memeow/screens/about_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatefulWidget {
  final int initialIndex;
  const MainScaffold({super.key, this.initialIndex = 0});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _currentIndex;
  late PageController _pageController;
  late AudioPlayer _audioPlayer;
  bool _isMusicPlaying = true;

  final List<Widget> _screens = const [
    MemeCollectionScreen(),
    HowToPlayScreen(),
    SettingsScreen(),
    AboutScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  void _playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audio/background_music.mp3'));
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
    _pageController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () {
            _pageController.jumpToPage(1); // How to Play is at index 1
          },
        ),
        title: const Text('Memeow'),
        actions: [
          IconButton(
            icon: Icon(_isMusicPlaying ? Icons.music_note : Icons.music_off),
            onPressed: _toggleMusic,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens.map((screen) => SingleChildScrollView(child: screen)).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'How to Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
