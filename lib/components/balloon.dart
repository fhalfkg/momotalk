import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class Balloon extends StatelessWidget {
  final String messageContent;
  final String messageType;

  const Balloon({
    Key? key,
    required this.messageContent,
    required this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BubbleStyle _bubbleStyle = BubbleStyle(
      color: const Color(0xFF4C5A6F),
      nip: messageType == 'sender' ? BubbleNip.leftTop : BubbleNip.rightTop,
      nipOffset: 8,
      nipWidth: 6,
      nipHeight: 8,
    );

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Bubble(
            style: _bubbleStyle,
            child: Text(
              messageContent,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
