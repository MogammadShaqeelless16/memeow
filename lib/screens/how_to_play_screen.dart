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
            _Step(number: 1, text: 'Read the situation presented at the top of the screen.'),
            _Step(number: 2, text: 'Swipe through the deck of cat meme cards.'),
            _Step(number: 3, text: 'Swipe RIGHT if the meme is a purr-fect reaction!'),
            _Step(number: 4, text: 'Swipe LEFT to see the next meme in your deck.'),
            _Step(number: 5, text: 'Share your hilarious creation with friends!'),
            SizedBox(height: 20),
            Text(
              'Pro Tip: The goal is to find the funniest match, not necessarily the "correct" one!',
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