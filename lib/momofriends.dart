import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/studentcard.dart';

class MomoFriendsPage extends StatefulWidget {
  const MomoFriendsPage({Key? key}) : super(key: key);

  @override
  _MomoFriendsPageState createState() => _MomoFriendsPageState();
}

class _MomoFriendsPageState extends State<MomoFriendsPage> {
  List? studentsKo;
  List? studentsCode;
  List? status;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/students.json');
    final data = await json.decode(response);
    setState(() {
      studentsKo = data['students_ko'];
      studentsCode = data['students_code'];
      status = data['status'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (BuildContext context, snapshot) {
        if (studentsKo != null && studentsCode != null && status != null) {
          return ListView.builder(
            itemCount: 57,
            itemBuilder: (BuildContext context, int index) {
              return StudentCardWidget(
                studentCode: studentsCode?[index],
                studentName: studentsKo?[index],
                status: status?[index],
              );
            },
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
