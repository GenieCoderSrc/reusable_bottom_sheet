import 'package:flutter/material.dart';
import 'package:reusable_bottom_sheet/views/widgets/pill_gesture.dart';

class SheetContent extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? supTitle;
  final TextStyle? titleTxtStyle;
  final double borderRadius;
  final double? titleBottomPadding;
  final double? sheetHeightFraction;
  final Color? bgColor;
  final bool hasPillGesture;
  final VoidCallback? onWillPop;
  final bool? isReverseScrolling;
  final EdgeInsetsGeometry? contentPadding;

  const SheetContent({
    super.key,
    this.child,
    this.title,
    this.supTitle,
    this.titleTxtStyle,
    required this.borderRadius,
    this.titleBottomPadding,
    this.sheetHeightFraction,
    this.bgColor,
    required this.hasPillGesture,
    this.onWillPop,
    this.isReverseScrolling,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      onPopInvokedWithResult: (canPop, data) => onWillPop?.call(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: FractionallySizedBox(
          heightFactor: sheetHeightFraction,
          child: Container(
            padding: contentPadding ?? const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: bgColor ?? theme.canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasPillGesture) const PillGesture(),
                if (title != null)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: titleBottomPadding ?? 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title!,
                          style:
                              titleTxtStyle ??
                              theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        if (supTitle != null)
                          Text(
                            supTitle!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (child != null)
                  Flexible(
                    child: SingleChildScrollView(
                      reverse: isReverseScrolling ?? true,
                      child: child!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
