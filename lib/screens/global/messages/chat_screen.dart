import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';

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
            Gap(kPadding24),
            Row(
              children: [
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: Icon(FluentIcons.chevron_down_24_regular)),
                Spacer(),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: Icon(FluentIcons.video_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: Icon(FluentIcons.call_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: Icon(FluentIcons.list_rtl_20_regular)),
              ],
            ),
            Gap(kPadding16),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/memoji.jpg"),
                  radius: 24,
                ),
                Gap(kPadding12),
                Text("Dr Lucy Lu", style: theme.textTheme.titleMedium),
              ],
            ),
            Gap(kPadding24),
            CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemBuilder: (context, index) => _buildMessageBubble(
                      'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate?',
                      true),
                  itemCount: 5,
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  _buildMessageBubble(
                    'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate?',
                    false,
                  ),
                  _buildMessageBubble(
                    'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate?',
                    true,
                  ),
                  _buildMessageBubble(
                    'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate?',
                    true,
                  ),
                  _buildImageMessage(
                      'https://example.com/image1.jpg'), // Replace with actual image URL
                  _buildMessageBubble(
                    'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate?',
                    true,
                  ),
                  _buildVoiceMessage(),
                  _buildImageMessage(
                      'https://example.com/image2.jpg'), // Replace with actual image URL
                ],
              ),
            ),
            MessageFormField(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isReceived) {
    return Align(
      alignment: isReceived ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isReceived ? Colors.purple.shade50 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16),
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
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.purple),
                Expanded(
                  child: Slider(
                    value: 0.5,
                    onChanged: (value) {},
                    activeColor: Colors.purple,
                    inactiveColor: Colors.purple.shade100,
                  ),
                ),
                Text('00:23'),
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
            icon: Icon(
              FluentIcons.attach_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton(
            icon: Icon(
              FluentIcons.camera_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton(
            icon: Icon(
              FluentIcons.mic_20_regular,
            ),
            onPressed: () {
              // Handle photo action
            },
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              fixedSize: Size.square(48),
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
