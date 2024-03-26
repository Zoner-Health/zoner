import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';

class ZonerButton extends StatelessWidget {
  const ZonerButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
    this.iconPath,
    this.icon,
    this.overrideIconColor = false,
    this.buttonType = AppButtonType.primary,
    this.isChipButton = false,
  });
  final VoidCallback onPressed;
  final String label;
  final AppButtonType buttonType;
  final IconData? icon;
  final String? iconPath;
  final Color? color;
  final Color? backgroundColor;
  final bool? overrideIconColor;
  final bool? isChipButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (icon != null && iconPath != null) {
      throw ErrorHint(
          "Cannot set both an icon and an iconPath property simultaneously, consider removing one");
    }
    if (overrideIconColor == true && color == null) {
      throw ErrorHint(
          "Must provide a color property if overrideIconColor is set to true");
    }

    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: color ?? Colors.white,
    );
    Color labelColor = theme.colorScheme.primary;
    switch (buttonType) {
      case AppButtonType.primary:
        labelColor = color ?? theme.colorScheme.onPrimary;

        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(36) : null,
          alignment: Alignment.center,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        break;

      case AppButtonType.secondary:
        labelColor = color ?? theme.colorScheme.onPrimaryContainer;

        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(36) : null,
          backgroundColor:
              backgroundColor ?? theme.colorScheme.primaryContainer,
          foregroundColor: labelColor,
        );
        break;

      case AppButtonType.outline:
        labelColor = color ?? theme.colorScheme.primary;

        style = ElevatedButton.styleFrom(
            fixedSize: isChipButton! ? const Size.fromHeight(36) : null,
            backgroundColor: Colors.transparent,
            foregroundColor: color ?? theme.colorScheme.primary,
            side: BorderSide(
              width: 1,
              color: labelColor,
            ),);

        break;
      case AppButtonType.text:
        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(36) : null,
          backgroundColor: Colors.transparent,
          foregroundColor: color ?? theme.colorScheme.primary,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;

      default:
        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(36) : null,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;
    }

    return ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: icon != null || iconPath != null,
                    child: Row(
                      children: [
                        icon != null
                            ? Icon(icon)
                            : SvgPicture.asset(iconPath ?? "",
                                colorFilter: ColorFilter.mode(
                                    labelColor, BlendMode.srcIn)),
                        const Gap(8)
                      ],
                    ),
                  ),
                  Text(label,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: labelColor)),
                ],
              ),
            ),
          );
  }
}
