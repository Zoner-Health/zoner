import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';

class MessagesScreen extends StatelessWidget {
  static const id = "messages";
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ZonerAppBar(
                pageTitle: 'Chats',
              ),

              // Search Bar
              ZonerSearchBar(),

              Gap(kPadding16),

              // Messages List
              CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                clipBehavior: Clip.antiAlias,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.zero,
                    sliver: SliverPrototypeExtentList.builder(
                      itemBuilder: (context, index) =>
                          FittedBox(child: ChatListItem()),
                      prototypeItem: ChatListItem(),
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: kPadding12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/image.jpg'), // Replace with actual profile image URL
            radius: 28,
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr Lucy Lu",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w800)),
                Gap(kPadding4),
                Text("Last Sent Message",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: ZonerColors.neutral50)),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: kPadding4, horizontal: kPadding8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPadding16),
                    color: theme.colorScheme.primary),
                child: Text(
                  '22',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
              Gap(kPadding8),
              Text("3:32 pm",
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: ZonerColors.neutral50)),
            ],
          ),
        ],
      ),
    );
  }
}
