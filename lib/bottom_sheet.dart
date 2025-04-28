import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';
import 'package:reusable_bottom_sheet/pill_gesture.dart';

void customBottomSheet({
  required BuildContext context,
  Widget? child,
  String? title,
  TextStyle? titleTxtStyle,
  String? supTitle,
  double borderRadius = 30,
  double? titleBottomPadding,
  double? sheetHeightFraction, // Adjust the fraction to control the height
  Color? bgColor,
  bool hasPillGesture = true,
  bool isScrollControlled = true,
  VoidCallback? onWillPop,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: isScrollControlled,
    context: context,
    builder: (_) {
      return PopScope(
        onPopInvokedWithResult: (bool canPop, dynamic data) {
          if (onWillPop != null) {
            onWillPop(); // Trigger pop event callback if provided
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: FractionallySizedBox(
            heightFactor: sheetHeightFraction, // Set the height factor here
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: bgColor ?? Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasPillGesture) const PillGesture(), // Added here
                    if (title != null)
                      Padding(
                        padding:
                        EdgeInsets.only(bottom: titleBottomPadding ?? 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(title ?? '',
                                style: titleTxtStyle ??
                                    AppTxtStyles.kMidTitleTextStyle),
                            if (supTitle != null)
                              Text(supTitle ?? '',
                                  style: AppTxtStyles.kSubTitleLightTextStyle),
                          ],
                        ),
                      ),
                    Container(child: child),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

// void customBottomSheet({
//   required BuildContext context,
//   Widget? child,
//   double borderRadius = 30,
//   Color? bgColor,
//   double? sheetHeightFraction, // Adjust the fraction to control the height
// }) {
//   showModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     context: context,
//     builder: (_) {
//       return Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: FractionallySizedBox(
//           heightFactor: sheetHeightFraction, // Set the height factor here
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Theme.of(context).canvasColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(borderRadius),
//                 topRight: Radius.circular(borderRadius),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const PillGesture(), // Added here
//                 if (child != null) ...[
//                   const SizedBox(
//                       height: 8.0), // Space between PillGesture and content
//                   Expanded(child: child),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }