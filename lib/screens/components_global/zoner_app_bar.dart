import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';

class ZonerAppBar extends StatelessWidget {
  final String pageTitle;
  final List<Widget>? actions;
  final bool? showTitle;
  final bool? showBackButton;

  const ZonerAppBar(
      {super.key,
      required this.pageTitle,
      this.actions,
      this.showTitle = true,
      this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(48),
        Row(
          children: [
            Visibility(
              visible: showBackButton!,
              child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: isDarkMode
                        ? ZonerColors.neutral20
                        : ZonerColors.neutral95,
                    elevation: 0,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(FluentIcons.chevron_left_24_regular)),
            ),
            const Spacer(),
            Visibility(
              visible: actions != null ? true : false,
              child: Row(
                children: actions ?? [],
              ),
            ),
            Visibility(
              visible: actions != null ? true : false,
              child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: isDarkMode
                        ? ZonerColors.neutral20
                        : ZonerColors.neutral95,
                    elevation: 0,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(FluentIcons.list_rtl_20_regular)),
            ),
          ],
        ),
        Visibility(
          visible: showTitle!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(pageTitle, style: theme.textTheme.displaySmall),
          ),
        ),
        const Gap(32),
      ],
    );
  }
}
