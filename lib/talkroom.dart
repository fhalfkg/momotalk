import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:momotalk/components/bottomchatbar.dart';

class TalkRoomPage extends StatefulWidget {
  final String title;

  const TalkRoomPage({
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
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: const Text('에피소드 선택'),
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Bubble(
                        style: _bubbleStyle,
                        child: const Text(
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
          Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2EDF2),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          color: const Color(0xFF4E8FB2),
                          height: 15,
                          width: 2,
                        ),
                        const Text('답장하기'),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: Colors.grey,
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('500배'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('50000배'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const BottomChatBar(),
            ],
          ),
        ],
      ),
    );
  }
}
