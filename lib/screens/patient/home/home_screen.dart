import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/patient/discover/find_doctors_screen.dart';
import 'package:zoner/screens/patient/sessions/components/session_card.dart';
import 'package:zoner/screens/patient/sessions/session_details_screen.dart';

import '../../../core/core.dart';
import '../../doctor/profile/components/components.dart';
import '../../shared/components_global/components.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //  final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kPadding24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding16),
                child: ProfileImageAppBar(),
              ),
              const Gap(kPadding48),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Session Requests",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 195,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: kPadding16),
                      sliver: SliverPrototypeExtentList.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => FittedBox(
                                child: SessionCard(
                                  margin:
                                      const EdgeInsets.only(right: kPadding16),
                                  sessionState: SessionState.request,
                                  onPressed: () {
                                    context.pushNamed(SessionDetailsScreen.id);
                                  },
                                ),
                              ),
                          prototypeItem: SessionCard(
                            onPressed: () {
                              context.pushNamed(SessionDetailsScreen.id);
                            },
                            margin: const EdgeInsets.only(right: kPadding16),
                            sessionState: SessionState.request,
                          )),
                    ),
                  ],
                ),
              ),
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Ongoing Sessions",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 180,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  //   physics: AlwaysScrollableScrollPhysics(),
                  restorationId: "ongoing_sessions_list",
                  slivers: [
                    SliverPadding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPadding16),
                      sliver: SliverPrototypeExtentList.builder(
                        itemBuilder: (context, index) => FittedBox(
                          child: SessionCard(
                            onPressed: () {
                              context.pushNamed(SessionDetailsScreen.id);
                            },
                            margin: const EdgeInsets.only(right: kPadding16),
                          ),
                        ),
                        prototypeItem: SessionCard(
                          onPressed: () {
                            context.pushNamed(SessionDetailsScreen.id);
                          },
                          margin: const EdgeInsets.only(right: kPadding16),
                        ),
                        itemCount: 3,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(kPadding32),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Discover",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const Gap(kPadding16),
                  LargePillChips(
                      onPressed: () {
                        context.pushNamed(FindDoctorsScreen.id);
                      },
                      color: theme.colorScheme.primary,
                      label: "Doctors",
                      icon: FluentIcons.person_24_filled),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Hospitals",
                      iconPath: "assets/svg/hospital-filled.svg"),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Labs",
                      icon: FluentIcons.beaker_24_filled),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Pharmacies",
                      icon: FluentIcons.pill_24_filled),
                  const Gap(kPadding16),
                ]),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Latest articles",
                      style: theme.textTheme.titleLarge,
                    )),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 248,
                child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(left: kPadding16),
                        sliver: SliverPrototypeExtentList.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const FittedBox(
                                child: ArticleCard(
                              margin: EdgeInsets.only(right: kPadding16),
                            ));
                          },
                          prototypeItem: const ArticleCard(),
                        ),
                      ),
                    ]),
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}
