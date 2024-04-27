import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/consultation/components/components.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';

class FindDoctorsScreen extends StatelessWidget {
  static const String id = "find_doctor";
  const FindDoctorsScreen({super.key});

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
                        child: TextFormField(
                          decoration:
                              ZonerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Search",
                            prefixIcon:
                                const Icon(FluentIcons.search_24_regular),
                            errorBorder: OutlineInputBorder(
                              gapPadding: 4,
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 1),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            disabledBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: const BorderSide(
                                  width: 1, color: ZonerColors.purple60),
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                      ),
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
                          onPressed: () {},
                          icon: const Icon(FluentIcons.filter_24_regular)),
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
