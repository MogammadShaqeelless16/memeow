import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sound Toggle
            SwitchListTile(
              title: const Text('Sound Effects'),
              value: true, // This would come from a state manager later
              onChanged: (bool value) {
                // TODO: Save setting
              },
            ),
            // Notifications Toggle
            SwitchListTile(
              title: const Text('Notifications'),
              value: false,
              onChanged: (bool value) {
                // TODO: Save setting
              },
            ),
            const Spacer(),
            // App Version
            Text(
              'App Version: 1.0.0',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ),
    );
  }
}