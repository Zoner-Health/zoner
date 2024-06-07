import 'package:flutter/material.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/global/messages/audio_call_screen.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZonerAppBar(),
          CallTimer(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ZonerColors.neutral20,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kPadding24),
                        topLeft: Radius.circular(kPadding24))),
              ),
              Positioned(
                bottom: 64,
                child: CallControls(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
