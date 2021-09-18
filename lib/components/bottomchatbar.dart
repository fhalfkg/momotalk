import 'package:flutter/material.dart';

class BottomChatBar extends StatelessWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '메시지를 보내 보세요!',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.2,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
