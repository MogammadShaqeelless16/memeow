
import 'package:flutter/material.dart';
import 'package:memeow/data/game_data.dart';

class MemeCollectionScreen extends StatelessWidget {
  const MemeCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme Collection'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: allMemes.length,
        itemBuilder: (context, index) {
          final meme = allMemes[index];
          return Card(
            child: Column(
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
          );
        },
      ),
    );
  }
}
