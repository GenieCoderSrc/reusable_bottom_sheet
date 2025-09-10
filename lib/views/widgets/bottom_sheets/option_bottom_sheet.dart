import 'package:flutter/material.dart';
import 'package:reusable_bottom_sheet/entity/option_entity.dart';
import 'package:reusable_bottom_sheet/views/widgets/option_list.dart';

import 'adaptive_bottom_sheet.dart';

Future<T?> showOptionBottomSheet<T>({
  required BuildContext context,
  String? title,
  String? supTitle,
  required List<OptionEntity>? options,
  Widget? optionItem,
  VoidCallback? onTap,
  double? height,
  Color? bgColor,
}) {
  return AdaptiveBottomSheet<T>(
    context: context,
    title: title,
    supTitle: supTitle,
    sheetHeightFraction: height,
    bgColor: bgColor,
    child: SingleChildScrollView(
      child: OptionList(options: options, onTap: onTap, optionItem: optionItem),
    ),
  ).show();
}
