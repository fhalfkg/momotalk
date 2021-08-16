import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'momofriends.dart';
import 'talklist.dart';
import 'tools/creatematerialcolor.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Momotalk',
      theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFFFA92A4)),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
          primaryIconTheme: IconThemeData(color: Colors.white),
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
  var _packageInfo;
  final List<Widget> _children = [MomoFriendsPage(), TalkListPage()];

  getPackageInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = packageInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image(image: AssetImage('images/momotalk.png'), width: 100),
        titleSpacing: 25,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => {
              showAboutDialog(
                context: context,
                applicationIcon: Image(
                  image: AssetImage('images/arona.png'),
                  width: 40,
                  height: 40,
                ),
                applicationName: "MomoTalk",
                applicationVersion:
                    "v${_packageInfo.version}(${_packageInfo.buildNumber})",
                applicationLegalese: "이 앱은 공식 허가를 받지 않았습니다.\n제작자: BrainInAVet",
              ),
            },
          )
        ],
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
      body: _children[_currentIndex],
    );
  }
}
