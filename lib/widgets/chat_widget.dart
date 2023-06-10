import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              chatIndex == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: chatIndex == 0
                    ? TextWidget(
                        label: msg,
                      )
                    : shouldAnimate
                        ? DefaultTextStyle(
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                            child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    msg.trim(),
                                  ),
                                ]),
                          )
                        : Text(
                            msg.trim(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
