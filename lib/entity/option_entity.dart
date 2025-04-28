import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class OptionEntity extends Equatable {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;

  const OptionEntity({
    this.icon,
    this.title,
    this.onTap,
  });

  @override
  List<Object?> get props => [icon, title, onTap];
}
