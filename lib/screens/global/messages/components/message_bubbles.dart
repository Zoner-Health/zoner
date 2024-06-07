import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/core.dart';

enum MessagePosition { start, middle, end, single }

class TextMessageBubble extends StatelessWidget {
  final bool? isReceived;
  final MessagePosition? messagePosition;
  final String message;
  final String? replyingMessage;
  const TextMessageBubble(
      {super.key,
      this.isReceived = true,
      this.messagePosition = MessagePosition.middle,
      required this.message,
      this.replyingMessage});

  @override
  Widget build(BuildContext context) {
    BorderRadius messageBorderRadius = BorderRadius.circular(kPadding16);
    BorderRadius replyMessageBorderRadius = BorderRadius.circular(kPadding16);

    switch (messagePosition) {
      case MessagePosition.middle:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      case MessagePosition.start:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: Radius.circular(kPadding16));
      case MessagePosition.end:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(kPadding16),
            bottomRight: Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      default:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(kPadding16),
            bottomRight: Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));
    }

    switch (messagePosition) {
      case MessagePosition.start:
        replyMessageBorderRadius = BorderRadius.only(
            topRight: Radius.circular(kPadding12),
            topLeft: Radius.circular(kPadding12),
            bottomRight: Radius.circular(kPadding4),
            bottomLeft: Radius.circular(kPadding4));
      default:
        replyMessageBorderRadius = BorderRadius.only(
            topRight: Radius.circular(isReceived! ? kPadding12 : kPadding4),
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding12),
            bottomRight: Radius.circular(kPadding4),
            bottomLeft: Radius.circular(kPadding4));
    }

    final ThemeData theme = Theme.of(context);
    return Align(
      alignment: isReceived! ? Alignment.centerLeft : Alignment.centerRight,
      child: AnimatedContainer(
        duration: 200.ms,
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(kPadding4),
        width: MediaQuery.sizeOf(context).width * .8,
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: isReceived!
                ? ZonerColors.neutral90
                : theme.colorScheme.primaryContainer,

            ///Might make this primary
            borderRadius: messageBorderRadius),
        child: replyingMessage != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding8, horizontal: kPadding12),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: replyMessageBorderRadius),
                    child: Text(
                      replyingMessage ?? "",
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: ZonerColors.neutral50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding4, horizontal: kPadding8),
                    child: Text(
                      message,
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kPadding8, horizontal: kPadding12),
                child: Text(
                  message,
                ),
              ),
      ),
    );
  }
}
