import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/talkcard.dart';

class TalkListPage extends StatefulWidget {
  TalkListPage({Key? key}) : super(key: key);

  @override
  _TalkListPageState createState() => _TalkListPageState();
}

class _TalkListPageState extends State<TalkListPage> {
  List? studentsKo;
  List? studentsCode;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/students.json');
    final data = await json.decode(response);
    setState(() {
      studentsKo = data['students_ko'];
      studentsCode = data['students_code'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (BuildContext context, snapshot) {
        if (studentsKo != null && studentsCode != null) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return TalkCardWidget(
                studentCode: studentsCode?[index],
                studentName: studentsKo?[index],
              );
            },
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
