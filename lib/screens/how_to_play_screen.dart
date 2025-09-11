
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Memeow!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'The goal of the game is to match the purr-fect cat meme to the given real-life scenario.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Here\'s how it works:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Read the scenario at the top of the screen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Choose the cat meme that you think best fits the situation from the four options provided.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. If you choose the correct meme, you\'ll hear a happy meow and your score will increase.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. If you choose the wrong meme, you\'ll hear a sad meow.',
              style: TextStyle(fontSize: 16),
            ),
             SizedBox(height: 10),
            Text(
              '5. The game ends when you have completed all the scenarios. Can you get a perfect score?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Good luck, and may the funniest cat win!',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
