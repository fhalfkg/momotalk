import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momotalk/components/studentcard.dart';
import 'package:momotalk/tools/creatematerialcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momotalk',
      theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFFFA92A4)),
          fontFamily: 'GyeonggiTitle'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "MomoTalk",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 25,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/people.svg",
                width: 30,
                height: 30,
                color: _currentIndex == 0 ? Colors.white : Color(0xFF78808C),
              ),
              label: "모모프레"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/talk.svg",
                width: 30,
                height: 30,
                color: _currentIndex == 1 ? Colors.white : Color(0xFF78808C),
              ),
              label: "대화"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color(0xFF4D5B70),
        selectedItemColor: Color(0xFF67788C),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: Center(
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
      ),
    );
  }
}
