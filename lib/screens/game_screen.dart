
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MemeowGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Load and add the background
    final background = SpriteComponent(
      sprite: await Sprite.load('background.png'),
    )..size = size;
    add(background);

    // Add the meme card
    add(MemeCard(position: size / 2));

    return super.onLoad();
  }
}

class MemeCard extends SpriteComponent {
  MemeCard({super.position}) : super(anchor: Anchor.center, size: Vector2(300, 400));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('meme_placeholder.png');
    return super.onLoad();
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paws & Play'),
      ),
      body: GameWidget(
        game: MemeowGame(),
      ),
    );
  }
}
