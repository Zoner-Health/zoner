import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';

import 'components/session_card.dart';

class SessionsScreen extends StatelessWidget {
  static const id = "session";
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const ZonerAppBar(pageTitle: "Sessions"),
          const Gap(48),
          Padding(
            padding: const EdgeInsets.only(left: kPadding16),
            child: Text(
              "Session Requests",
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Gap(kPadding16),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const Gap(kPadding16);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return const SessionCard(
                  sessionState: SessionState.request,
                );
              }),
          const Gap(kPadding24),
          Padding(
            padding: const EdgeInsets.only(left: kPadding16),
            child: Text(
              "Ongoing Sessions",
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Gap(kPadding16),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const Gap(kPadding16);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return const SessionCard(
                  sessionState: SessionState.ongoing,
                );
              }),
          const Gap(kPadding24),
          Padding(
            padding: const EdgeInsets.only(left: kPadding16),
            child: Text(
              "Previous Sessions",
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Gap(kPadding16),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const Gap(kPadding16);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return const SessionCard(
                  sessionState: SessionState.completed,
                );
              }),
        ],
      ),
    );
  }
}
