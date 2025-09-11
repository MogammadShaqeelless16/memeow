
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:memeow/data/game_data.dart';
import 'package:memeow/models/scenario.dart';
import 'package:memeow/models/meme.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentScenarioIndex = 0;
  int _score = 0;
  bool _answered = false;
  String? _selectedMemeId;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _handleAnswer(String selectedMemeId) {
    if (_answered) return;

    final scenario = scenarios[_currentScenarioIndex];
    final isCorrect = selectedMemeId == scenario.correctMemeId;

    setState(() {
      _selectedMemeId = selectedMemeId;
      _answered = true;
      if (isCorrect) {
        _score++;
        _audioPlayer.play(AssetSource('audio/correct_answer.mp3'));
      } else {
        _audioPlayer.play(AssetSource('audio/incorrect_answer.mp3'));
      }
    });

    Timer(const Duration(seconds: 2), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentScenarioIndex < scenarios.length - 1) {
        _currentScenarioIndex++;
        _answered = false;
        _selectedMemeId = null;
      } else {
        // Game over
        _showEndDialog();
      }
    });
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Game Over!'),
        content: Text('Your score: $_score / ${scenarios.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentScenarioIndex = 0;
                _score = 0;
                _answered = false;
                _selectedMemeId = null;
              });
            },
            child: const Text('Play Again'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to main menu
            },
            child: const Text('Main Menu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Scenario currentScenario = scenarios[_currentScenarioIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match the Meme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentScenario.situation,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: currentScenario.options.length,
                itemBuilder: (context, index) {
                  final Meme meme = currentScenario.options[index];
                  return _buildMemeOption(meme, currentScenario);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemeOption(Meme meme, Scenario scenario) {
    Color? tileColor;
    IconData? feedbackIcon;

    if (_answered) {
      if (meme.id == scenario.correctMemeId) {
        tileColor = Colors.green.withOpacity(0.5);
        feedbackIcon = Icons.check_circle;
      } else if (meme.id == _selectedMemeId) {
        tileColor = Colors.red.withOpacity(0.5);
        feedbackIcon = Icons.cancel;
      }
    }

    return GestureDetector(
      onTap: () => _handleAnswer(meme.id),
      child: Card(
        color: tileColor,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    meme.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meme.name, textAlign: TextAlign.center),
                ),
              ],
            ),
            if (feedbackIcon != null)
              Center(
                child: Icon(feedbackIcon, color: Colors.white, size: 50),
              ),
          ],
        ),
      ),
    );
  }
}
