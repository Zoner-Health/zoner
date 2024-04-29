import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/patient/consultation/components/sickler_calendar_day_selector.dart';

class ScheduleAppointmentCalendarScreen extends StatelessWidget {
  static const String id = "schedule_appointment_calendar";
  const ScheduleAppointmentCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const ZonerAppBar(pageTitle: "Schedule Consultation"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/memoji.jpg")))),
                      Gap(kPadding12),
                      Text("Dr Lucy Lu's Calendar",
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  Gap(kPadding16),

                  ///Month Selector
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kPadding16, vertical: kPadding8),
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(kPadding32)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("October"),
                        Gap(kPadding8),
                        Icon(FluentIcons.chevron_down_24_regular)
                      ],
                    ),
                  ),
                  Gap(kPadding16),
                  Row(
                    children: [
                      Text("This Week"),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FluentIcons.chevron_left_24_regular)),
                      Gap(kPadding8),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FluentIcons.chevron_right_24_regular)),
                    ],
                  ),
                  Gap(kPadding8),
                  CalendarWeekDaySelector(selectedDay: (selectedDay) {
                    print(selectedDay);
                  }),
                  Gap(kPadding16),
                  Text(
                    "Tuesday, Oct 03, 2024",
                    style: theme.textTheme.headlineSmall!.copyWith(
                        color: theme.colorScheme.primary,
                        fontFamily: "Plus Jakarta Sans"),
                  ),
                  const Gap(kPadding64),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
