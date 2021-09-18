import 'package:flutter/material.dart';

class TalkCardWidget extends StatefulWidget {
  final String studentCode;
  final String studentName;
  final Function()? onTap;

  const TalkCardWidget({
    Key? key,
    required this.studentCode,
    required this.studentName,
    this.onTap,
  }) : super(key: key);

  @override
  _TalkCardWidgetState createState() => _TalkCardWidgetState();
}

class _TalkCardWidgetState extends State<TalkCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: InkWell(
          onTap: widget.onTap ?? () {},
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            padding: const EdgeInsets.all(26),
            width: double.infinity,
            child: Row(
              children: [
                Image(
                    image: AssetImage("images/${widget.studentCode}.png"),
                    width: 50,
                    height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.studentName,
                        style: const TextStyle(fontSize: 18),
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                    ),
                    Container(
                      child: const Text(
                        '5개의 에피소드',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
