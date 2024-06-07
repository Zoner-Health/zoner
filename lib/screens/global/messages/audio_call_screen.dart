import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../../../core/core.dart';

class AudioCallScreen extends StatelessWidget {
  const AudioCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Column(
        children: [
          ZonerAppBar(),
          Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/memoji.svg"),
            radius: 48,
          ),
          Spacer(),
          CallControls(),
          Gap(kPadding64),
        ],
      ),
    );
  }
}

class CallControls extends StatelessWidget {
  const CallControls({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(kPadding32)),
      padding: EdgeInsets.all(kPadding16),
      child: Column(
        children: [
          Text("Dave Davidson", style: theme.textTheme.titleMedium),
          Gap(kPadding8),
          Text("Patient"),
          Row(
            children: [
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: Icon(FluentIcons.speaker_0_24_regular)),
              Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: Icon(FluentIcons.camera_24_regular)),
              Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: Icon(FluentIcons.mic_24_regular)),
              Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: Icon(FluentIcons.chat_24_regular)),
              Gap(kPadding12),
              IconButton.filled(
                style: IconButton.styleFrom(
                    fixedSize: Size.square(48),
                    backgroundColor: ZonerColors.redSeed),
                onPressed: () {},
                icon: Icon(FluentIcons.call_24_filled),
              ),
              Gap(kPadding12),
            ],
          )
        ],
      ),
    );
  }
}

class CallTimer extends StatelessWidget {
  const CallTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: kPadding24, vertical: kPadding16),
      decoration: BoxDecoration(

          ///Might make this glassmorphism
          borderRadius: BorderRadius.circular(kPadding24),
          color: Colors.white.withOpacity(.2)),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ZonerColors.greenSeed,
            ),
          ),
          Gap(kPadding8),
          Text(
            "16:35",
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
