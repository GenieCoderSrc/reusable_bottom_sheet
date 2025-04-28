import 'package:flutter/material.dart';
import 'package:reusable_bottom_sheet/reusable_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Bottom Sheet Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomSheetExampleScreen(),
    );
  }
}

class BottomSheetExampleScreen extends StatelessWidget {
  const BottomSheetExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable Bottom Sheet Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showOptionBottomSheet(
              context: context,
              title: 'Options',
              supTitle: 'Choose one',
              options: [
                const OptionEntity(
                  icon: Icons.camera_alt,
                  title: 'Camera',
                ),
                const OptionEntity(
                  icon: Icons.photo,
                  title: 'Gallery',
                ),
                const OptionEntity(
                  icon: Icons.share,
                  title: 'Share',
                ),
              ],
              onTap: () {
                Navigator.pop(context);
              },
            );
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
