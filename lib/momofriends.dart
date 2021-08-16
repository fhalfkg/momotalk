import 'package:flutter/material.dart';

import 'components/studentcard.dart';

class MomoFriendsPage extends StatefulWidget {
  MomoFriendsPage({Key? key}) : super(key: key);

  @override
  _MomoFriendsPageState createState() => _MomoFriendsPageState();
}

class _MomoFriendsPageState extends State<MomoFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StudentCardWidget(
            studentCode: 'arona',
            studentName: "아로나",
            status: "기다리고 있을게요, 선생님",
          ),
          StudentCardWidget(
            studentCode: 'shiroko',
            studentName: "시로코",
            status: "라이딩 팀원 모집 중...... (아직 1/5)",
          ),
          StudentCardWidget(
            studentCode: 'yuzu',
            studentName: "유즈",
            status: "404 Not Found",
          ),
        ],
      ),
    );
  }
}
