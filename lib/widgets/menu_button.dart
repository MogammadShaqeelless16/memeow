
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MenuButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 400.ms);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward(from: 0.0);
    // The original onPressed is called after the animation completes.
    Future.delayed(400.ms).then((_) {
      if (mounted) {
        widget.onPressed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      controller: _controller,
      effects: [ShakeEffect(hz: 3, rotation: 0.02, duration: 300.ms)],
      child: ElevatedButton.icon(
        icon: Icon(widget.icon),
        label: Text(widget.text),
        onPressed: _handleTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
