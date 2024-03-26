import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/core.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Gap(24),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage("assets/images/memoji.png"),
                      ),
                      const Gap(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Welcome",
                            style: theme.textTheme.bodyMedium,
                          ),
                          const Gap(4),
                          Text("Dave", style: theme.textTheme.headlineSmall)
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FluentIcons.list_rtl_20_regular))
                    ],
                  ),
                  const Gap(16),
                  const ConsultationCard(),
                  const Gap(16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Consult",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontFamily: "Gloock"),
                    ),
                  ),
                  const Gap(8),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Gap(16),
                  ConsultationCTACard(
                    onPressed: () {
                      ///Todo: start consultation Flow
                    },
                    label: "Consult\n with AI",
                    labelColor: ZonerColors.yellow60,
                  ),
                  const Gap(16),
                  ConsultationCTACard(
                    onPressed: () {
                      ///Todo: start consultation Flow
                    },
                    backgroundColor: theme.colorScheme.primaryContainer,
                    labelColor: theme.primaryColor,
                  ),
                  const Gap(16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

