import 'package:flutter/material.dart';

class TalkListPage extends StatefulWidget {
  TalkListPage({Key? key}) : super(key: key);

  @override
  _TalkListPageState createState() => _TalkListPageState();
}

class _TalkListPageState extends State<TalkListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('대화'),
    );
  }
}
