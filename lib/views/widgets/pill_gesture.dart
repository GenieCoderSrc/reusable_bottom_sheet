import 'package:flutter/material.dart';

class PillGesture extends StatelessWidget {
  final Color? pillColor;

  const PillGesture({super.key, this.pillColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            Container(
              height: 5.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: pillColor ?? Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
