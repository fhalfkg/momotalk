import 'package:flutter/material.dart';

class StudentCardWidget extends StatefulWidget {
  final String studentCode;
  final String studentName;
  final String status;

  const StudentCardWidget({
    Key? key,
    required this.studentCode,
    required this.studentName,
    required this.status,
  }) : super(key: key);

  _StudentCardWidgetState createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(26),
          width: double.infinity,
          child: Row(
            children: [
              Image(
                  image: AssetImage("images/${widget.studentCode}.png"), width: 50, height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.studentName,
                      style: TextStyle(fontSize: 18),
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                  ),
                  Container(
                    child: Text(
                      widget.status,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
