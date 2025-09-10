import 'package:flutter/material.dart';
import 'package:reusable_bottom_sheet/views/widgets/sheet_contents/sheet_content.dart';

Future<T?> showMobileBottomSheet<T>({
  required BuildContext context,
  required SheetContent content,
  bool? isScrollControlled,
  Color? bgColor,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled ?? true,
    backgroundColor: bgColor ?? Colors.transparent,
    builder: (_) => content,
  );
}
