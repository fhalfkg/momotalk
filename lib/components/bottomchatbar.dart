import 'package:flutter/material.dart';
import 'package:momotalk/components/balloon.dart';

import '../talkroom.dart';

class BottomChatBar extends StatefulWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  BottomChatBarState createState() => BottomChatBarState();
}

class BottomChatBarState extends State<BottomChatBar> {
  final TextEditingController _textController = TextEditingController();
  bool _changeButtonColor = false;

  @override
  Widget build(BuildContext context) {
    TalkRoomPageState? parent =
        context.findAncestorStateOfType<TalkRoomPageState>();

    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                controller: _textController,
                onTap: () {
                  parent?.scrollToEndWhenTap();
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '메시지를 보내 보세요!',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          GestureDetector(
            onTapDown: (TapDownDetails details) => {
              setState(() {
                _changeButtonColor = true;
              }),
            },
            onTapUp: (TapUpDetails details) => {
              setState(() {
                _changeButtonColor = false;
              }),
            },
            onTapCancel: () => {
              setState(() {
                _changeButtonColor = false;
              }),
            },
            onTap: () => {
              parent?.setState(() {
                if (_textController.text != '') {
                  parent.messages.add(Balloon(
                      messageContent: _textController.text,
                      messageType: 'receiver'));
                  parent.needsScroll = true;
                }
              }),
              setState(() {
                _textController.text = '';
              }),
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: _changeButtonColor == true
                    ? Colors.lightBlueAccent
                    : Colors.lightBlue,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
