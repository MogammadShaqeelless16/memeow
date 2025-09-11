
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Data for the draggable memes. In a real app, this would be more complex.
  final List<String> _memes = [
    'assets/images/meme_placeholder.png',
    'assets/images/meme_placeholder.png',
    'assets/images/meme_placeholder.png',
    'assets/images/meme_placeholder.png',
  ];

  // Data for the drop targets and what they've accepted
  final Map<String, String?> _dropTargets = {
    'Your Grandma': null,
    'Your Mom': null,
    'You': null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match the Meme'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // 1. Scenario Widget
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'POV: You told your grandma you were sick in front of your mom.',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // 2. Drop Zones for Roles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _dropTargets.keys.map((role) {
              return _buildDropZone(role);
            }).toList(),
          ),
          const Spacer(),

          // 3. Draggable Meme Palette
          _buildMemePalette(),
        ],
      ),
    );
  }

  Widget _buildDropZone(String role) {
    final acceptedMeme = _dropTargets[role];

    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Column(
          children: [
            Text(role, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Container(
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                color: candidateData.isNotEmpty ? Colors.lightGreen.withOpacity(0.3) : Colors.grey.shade200,
                border: Border.all(
                  color: candidateData.isNotEmpty ? Colors.green : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: acceptedMeme != null
                  ? Image.asset(acceptedMeme, fit: BoxFit.cover)
                  : const Center(child: Icon(Icons.add_photo_alternate_outlined, color: Colors.grey)),
            ),
          ],
        );
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        setState(() {
          _dropTargets[role] = data;
        });
      },
    );
  }

  Widget _buildMemePalette() {
    return Container(
      height: 120,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _memes.length,
        itemBuilder: (context, index) {
          final meme = _memes[index];
          return Draggable<String>(
            data: meme,
            feedback: Image.asset(meme, height: 100, width: 75, fit: BoxFit.cover),
            childWhenDragging: Container(
              width: 75,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey.shade400,
            ),
            child: Container(
              width: 75,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(meme, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
