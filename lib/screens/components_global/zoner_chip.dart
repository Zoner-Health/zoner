import 'package:flutter/material.dart';

import '../../core/core.dart';

class ZonerChip extends StatefulWidget {
  const ZonerChip({
    super.key,
    this.onSelected,
    required this.label,
    this.chipType = AppChipType.filter,
    this.color,
    this.backgroundColor,
  });

  final Function(bool)? onSelected;
  final AppChipType chipType;
  final String label;
  final Color? color;
  final Color? backgroundColor;

  @override
  State<ZonerChip> createState() => _ZonerChipState();
}

class _ZonerChipState extends State<ZonerChip> {
  bool labelSelected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chipType == AppChipType.filter &&
        widget.onSelected == null) {
      throw ErrorHint(
          "onSelected must not be null on a Filter Chip type, please consider adding the onSelected parameter");
    }
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    Color selectedLabelColor = ZonerColors.blue20;
    Color unselectedLabelColor =
        !isDarkMode ? ZonerColors.neutral30 : ZonerColors.white;
    return widget.chipType == AppChipType.filter
        ? FilterChip(
            side: labelSelected
                ? BorderSide(width: 1, color: theme.colorScheme.primary)
                : BorderSide.none,
            showCheckmark: true,
            checkmarkColor:
                labelSelected ? selectedLabelColor : unselectedLabelColor,
            selected: labelSelected,
            label: Text(
              widget.label,
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: labelSelected
                      ? selectedLabelColor
                      : unselectedLabelColor),
            ),
            onSelected: (value) {
              setState(() {
                labelSelected = value;
              });

              widget.onSelected!.call(value);
            })
        : Chip(
            //side: BorderSide(width: 1, color: theme.colorScheme.primary),
            backgroundColor: !isDarkMode
                ? widget.backgroundColor ?? ZonerColors.blue90
                : widget.backgroundColor ?? theme.colorScheme.primary,
            label: Text(
              widget.label,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: widget.color ?? ZonerColors.blue10),
            ),
          );
  }
}
