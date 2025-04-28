import 'package:flutter/material.dart';

import 'entity/option_entity.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.option, this.onTap});

  final OptionEntity option;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ?? option.onTap,
      leading: Icon(option.icon),
      title: Text(option.title ?? ""),
    );
  }
}
