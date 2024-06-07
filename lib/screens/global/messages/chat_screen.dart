import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';

import 'components/message_bubbles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            const Gap(kPadding64),
            Row(
              children: [
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.chevron_left_24_regular)),
                const Spacer(),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.video_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.call_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.list_rtl_20_regular)),
              ],
            ),
            const Gap(kPadding8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/memoji.jpg"),
                  radius: 32,
                ),
                const Gap(kPadding12),
                Text("Dr Lucy Lu", style: theme.textTheme.titleMedium),
              ],
            ),
            const Gap(kPadding24),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => TextMessageBubble(
                      replyingMessage: "Replied to this message",
                      message: 'Yorem ipsum dolor sit',
                    ),
                    itemCount: 3,
                  )
                ],
              ),
            ),
            const MessageFormField(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageMessage(String imageUrl) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildVoiceMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.play_arrow, color: Colors.purple),
                Expanded(
                  child: Slider(
                    value: 0.5,
                    onChanged: (value) {},
                    activeColor: Colors.purple,
                    inactiveColor: Colors.purple.shade100,
                  ),
                ),
                const Text('00:23'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageFormField extends StatelessWidget {
  const MessageFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                decoration: ZonerInputDecoration.inputDecoration(context)
                    .copyWith(hintText: "Write a message")),
          ),
          IconButton(
            icon: const Icon(
              FluentIcons.attach_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton(
            icon: const Icon(
              FluentIcons.camera_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton(
            icon: const Icon(
              FluentIcons.mic_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              fixedSize: const Size.square(48),
            ),
            icon: Icon(
              FluentIcons.send_24_filled,
              color: theme.scaffoldBackgroundColor,
            ),
            onPressed: () {
              // Handle send action
            },
          ),
        ],
      ),
    );
  }
}
