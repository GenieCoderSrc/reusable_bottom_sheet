import 'package:flutter/material.dart';

import 'entity/option_entity.dart';
import 'option_item.dart';

class OptionList extends StatelessWidget {
  const OptionList({
    super.key,
    this.options,
    required this.optionItem,
    this.onTap,
  });

  final List<OptionEntity>? options;
  final Widget? optionItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return options != null
        ? Column(
          children:
              options!
                  .map(
                    (option) =>
                        optionItem ?? OptionItem(option: option, onTap: onTap),
                  )
                  .toList(),
        )
        : const SizedBox();
  }
}
