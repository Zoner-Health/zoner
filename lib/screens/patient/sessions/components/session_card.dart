import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/sessions/components/double_avatar.dart';

import '../../../../core/core.dart';
import '../../../components_global/components.dart';

enum SessionState { request, ongoing, completed }

class SessionCard extends StatelessWidget {
  final SessionState sessionState;
  const SessionCard({super.key, this.sessionState = SessionState.ongoing});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    BoxDecoration sessionDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding24),
        border: Border.all(
            width: 1,
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90));

    switch (sessionState) {
      case SessionState.ongoing:
        sessionDecoration = BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          color: theme.cardColor,
        );

      default:
        sessionDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding24),
            border: Border.all(
                width: 1,
                color: isDarkMode
                    ? ZonerColors.neutral20
                    : ZonerColors.neutral90));
    }

    return Container(
      padding: const EdgeInsets.all(kPadding16),
      decoration: sessionDecoration,
      child: Column(
        children: [
          const DoubleAvatar(
            imagePath1: "assets/images/memoji.png",
            imagePath2: "assets/images/memoji.jpg",
          ),
          const Gap(kPadding8),
          const Text("Session with Dr Lucy"),
          Visibility(
            visible: sessionState == SessionState.request,
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Session with Dr Lucy",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(FluentIcons.calendar_24_regular),
                        const Gap(8),
                        Text(
                          "25 May 2023, 9am",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(kPadding16),
                FittedBox(
                  child: ZonerButton(
                      onPressed: () {
                        ///Todo: View Session Details
                      },
                      label: "View"),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  child: ZonerButton(
                      buttonType: AppButtonType.text,
                      color: theme.colorScheme.error,
                      onPressed: () {
                        ///Todo: Decline session request
                      },
                      label: "Decline"),
                ),
                const Gap(kPadding16),
                FittedBox(
                  child: ZonerButton(
                      buttonType: AppButtonType.outline,
                      onPressed: () {
                        ///Todo: Decline session request
                      },
                      label: "Approve"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
