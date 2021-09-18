import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'momofriends.dart';
import 'talklist.dart';
import 'tools/creatematerialcolor.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Momotalk',
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xFFFA92A4)),
          primaryTextTheme: const TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
          primaryIconTheme: const IconThemeData(color: Colors.white),
          fontFamily: 'GyeonggiTitle'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PackageInfo _packageInfo;
  final List<Widget> _children = [
    const MomoFriendsPage(),
    const TalkListPage()
  ];

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:
            const Image(image: AssetImage('images/momotalk.png'), width: 100),
        titleSpacing: 25,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => {
              showAboutDialog(
                context: context,
                applicationIcon: const Image(
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
                color:
                    _currentIndex == 0 ? Colors.white : const Color(0xFF78808C),
              ),
              label: "모모프레"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/talk.svg",
                width: 30,
                height: 30,
                color:
                    _currentIndex == 1 ? Colors.white : const Color(0xFF78808C),
              ),
              label: "대화"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF4D5B70),
        selectedItemColor: const Color(0xFF67788C),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: _children[_currentIndex],
    );
  }
}
