import 'package:flutter/material.dart';

class BottomChatBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '메시지를 보내 보세요!',
                  ),
                  cursorHeight: 20,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
