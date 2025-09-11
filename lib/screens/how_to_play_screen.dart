import 'package:flutter/material.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Step(number: 1, text: 'Read the hilarious scenario presented at the top of the screen.'),
            _Step(number: 2, text: 'Identify the different roles in the scene (e.g., "Your Mom," "Your Grandma," "You").'),
            _Step(number: 3, text: 'Browse the library of kitty memes available to you.'),
            _Step(number: 4, text: 'Drag and drop the purr-fect kitty meme onto each role to complete the scene.'),
            _Step(number: 5, text: 'Confirm your choices to see your score and move to the next level!'),
            SizedBox(height: 20),
            Text(
              'Pro Tip: The funnier and more accurate the meme for the role, the higher your score!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// A helper widget for each step
class _Step extends StatelessWidget {
  final int number;
  final String text;

  const _Step({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
