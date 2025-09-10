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
      title: 'Bottom Sheet Example',
      theme: ThemeData(primarySwatch: Colors.blue),
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
        title: const Text('Bottom Sheet Demo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              // Text input with String return
              ElevatedButton(
                onPressed: () async {
                  final result = await AdaptiveBottomSheet<String>(
                    context: context,
                    title: "Enter your name",
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Type your name...",
                      ),
                      onSubmitted: (value) => Navigator.pop(context, value),
                    ),
                  ).show();

                  debugPrint(
                    "String result: $result",
                  ); // null if closed without input
                },
                child: const Text('Text Input Bottom Sheet (String)'),
              ),

              // Custom content with void return
              ElevatedButton(
                onPressed: () async {
                  await AdaptiveBottomSheet<void>(
                    context: context,
                    title: "Custom Content",
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("No value returned here."),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close"),
                        ),
                      ],
                    ),
                    onOpened: () => debugPrint("Bottom sheet opened"),
                    onClosed: (_) => debugPrint("Bottom sheet closed"),
                  ).show();
                },
                child: const Text('Custom Content Bottom Sheet (void)'),
              ),

              // Dynamic return type
              ElevatedButton(
                onPressed: () async {
                  final result = await AdaptiveBottomSheet<dynamic>(
                    context: context,
                    title: "Dynamic Content",
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, 123),
                          child: const Text("Return int 123"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, "Hello"),
                          child: const Text("Return String 'Hello'"),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Return nothing (null)"),
                        ),
                      ],
                    ),
                  ).show();

                  debugPrint("Dynamic result: $result");
                },
                child: const Text('Dynamic Return Bottom Sheet'),
              ),

              // Option list with String return
              ElevatedButton(
                onPressed: () async {
                  final result = await AdaptiveBottomSheet<String>(
                    context: context,
                    title: "Options",
                    sheetHeightFraction: 0.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Camera'),
                          onTap: () => Navigator.pop(context, 'Camera'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Gallery'),
                          onTap: () => Navigator.pop(context, 'Gallery'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text('Share'),
                          onTap: () =>
                              Navigator.pop(context), // no value, returns null
                        ),
                      ],
                    ),
                  ).show();

                  debugPrint("Option result: $result"); // null if Share tapped
                },
                child: const Text('Options List Bottom Sheet'),
              ),

              // Option list with showOptionBottomSheet
              ElevatedButton(
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
                      const OptionEntity(icon: Icons.photo, title: 'Gallery'),
                      const OptionEntity(icon: Icons.share, title: 'Share'),
                    ],
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
                child: const Text('Option Bottom Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
