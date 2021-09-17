import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:momotalk/components/bottomchatbar.dart';

class TalkRoomPage extends StatefulWidget {
  final String title;

  TalkRoomPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _TalkRoomPageState createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  static const _bubbleStyle = BubbleStyle(
    color: Color(0xFF4C5A6F),
    nip: BubbleNip.leftTop,
    nipOffset: 8,
    nipWidth: 6,
    nipHeight: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: Text('에피소드 선택'),
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Bubble(
                          style: _bubbleStyle,
                          child: Text(
                            '테스트테스트테스트테스트\n테스트테스트테스트테스트',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xFFE2EDF2),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          color: Color(0xFF4E8FB2),
                          height: 15,
                          width: 2,
                        ),
                        Text('답장하기'),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      color: Colors.grey,
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('500배'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('50000배'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BottomChatBar(),
            ],
          ),
        ],
      ),
    );
  }
}
