import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import 'entity/option_entity.dart';
import 'option_list.dart';

void showOptionBottomSheet({
  required BuildContext context,
  String? title,
  String? supTitle,
  required List<OptionEntity>? options,
  Widget? optionItem,
  VoidCallback? onTap,
  double? height,
  Color? bgColor = Colors.white,
}) {
  return customBottomSheet(
    context: context,
    sheetHeightFraction: height,
    bgColor: bgColor,
    title: title,
    supTitle: supTitle,
    child: Expanded(
      child: SingleChildScrollView(
        child:
            OptionList(options: options, onTap: onTap, optionItem: optionItem),
      ),
    ),
  );
}
