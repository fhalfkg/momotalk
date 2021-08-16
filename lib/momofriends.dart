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
            studentName: "아로나",
            status: "학생",
          ),
          StudentCardWidget(
            studentName: "시로코",
            status: "학생2",
          ),
          StudentCardWidget(
            studentName: "히후미",
            status: "학생3",
          ),
        ],
      ),
    );
  }
}
