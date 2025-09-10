import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reusable_bottom_sheet/views/widgets/dialogs/dialog_sheet.dart';
import 'package:reusable_bottom_sheet/views/widgets/sheet_contents/sheet_content.dart';

import 'bottom_sheet.dart';

class AdaptiveBottomSheet<T> {
  final BuildContext context;
  final Widget? child;
  final String? title;
  final String? supTitle;
  final TextStyle? titleTxtStyle;
  final double borderRadius;
  final double? titleBottomPadding;
  final double? sheetHeightFraction;
  final Color? bgColor;
  final bool hasPillGesture;
  final bool? isScrollControlled;
  final VoidCallback? onWillPop;
  final VoidCallback? onOpened;
  final void Function(T? result)? onClosed;
  final bool? isReverseScrolling;
  final EdgeInsetsGeometry? contentPadding;

  AdaptiveBottomSheet({
    required this.context,
    this.child,
    this.title,
    this.supTitle,
    this.titleTxtStyle,
    this.borderRadius = 30,
    this.titleBottomPadding,
    this.contentPadding,
    this.sheetHeightFraction,
    this.bgColor,
    this.hasPillGesture = true,
    this.isScrollControlled,
    this.isReverseScrolling,
    this.onWillPop,
    this.onOpened,
    this.onClosed,
  });

  Future<T?> show() async {
    final isMobile =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS);

    final content = SheetContent(
      child: child,
      title: title,
      supTitle: supTitle,
      titleTxtStyle: titleTxtStyle,
      borderRadius: borderRadius,
      titleBottomPadding: titleBottomPadding,
      contentPadding: contentPadding,
      sheetHeightFraction: sheetHeightFraction,
      bgColor: bgColor,
      hasPillGesture: hasPillGesture,
      onWillPop: onWillPop,
      isReverseScrolling: isReverseScrolling,
    );

    onOpened?.call();
    final result = isMobile
        ? await showMobileBottomSheet<T>(
            context: context,
            content: content,
            isScrollControlled: isScrollControlled,
          )
        : await showDesktopDialog<T>(
            context: context,
            content: content,
            borderRadius: borderRadius,
            bgColor: bgColor,
          );
    onClosed?.call(result);
    return result;
  }
}
