import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/consultation/components/components.dart';
import 'package:zoner/screens/patient/consultation/components/search_filter.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';

class FindDoctorsScreen extends StatefulWidget {
  static const String id = "find_doctor";
  const FindDoctorsScreen({super.key});

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchBarController = TextEditingController();
  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ZonerAppBar(
              pageTitle: "Find\nDoctors",
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FluentIcons.cart_24_regular),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FluentIcons.list_rtl_20_regular),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ZonerSearchBar(
                        controller: searchBarController,
                      )),
                      const Gap(kPadding8),
                      IconButton.filled(
                          style: IconButton.styleFrom(
                              backgroundColor: theme.cardColor,
                              fixedSize: const Size.square(48)),
                          onPressed: () {},
                          icon: const Icon(FluentIcons.map_24_regular)),
                    ],
                  ),
                  const Gap(kPadding8),
                  Wrap(
                    spacing: 8,
                    children: [
                      IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: theme.cardColor,
                          ),
                          onPressed: () {
                            _overlayPortalController.toggle();
                          },
                          icon: OverlayPortal(
                              controller: _overlayPortalController,
                              overlayChildBuilder: (context) => Positioned(
                                      top: 150,
                                      left: 0,
                                      right: 0,
                                      child: SearchFilter(
                                        onClosedPressed: () {
                                          _animationController.reverse().then(
                                              (value) =>
                                                  _overlayPortalController
                                                      .hide());
                                        },
                                      ))
                                  .animate(controller: _animationController)
                                  .fadeIn()
                                  .scale(
                                    curve: Curves.easeInOutCubic,
                                    duration: 250.ms,
                                    alignment: Alignment.topLeft,
                                    begin: const Offset(0, 0),
                                    end: const Offset(1, 1),
                                  ),
                              child:
                                  const Icon(FluentIcons.filter_24_regular))),
                      const ZonerChip(
                        chipType: AppChipType.info,
                        label: "Doctor",
                        icon: FluentIcons.beaker_16_regular,
                      ),
                    ],
                  ),
                  const Gap(32),
                  Text(
                    "Doctors",
                    style: theme.textTheme.titleLarge,
                  ),
                  const Gap(kPadding16),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          const DoctorSearchResultCard(),
                      separatorBuilder: (context, index) =>
                          const Gap(kPadding8),
                      itemCount: 5),
                  const Gap(kPadding64),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
