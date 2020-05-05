import 'package:flutter/material.dart';
import 'reportData.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  final Report report;

  ReportScreen({this.report});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.report.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffccffdd),
      ),
      body: Center(
          child: Container(
        height: 268.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Ellipse.png"),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => Info(report: widget.report)));
        },
        label: Text('info'),
        icon: Icon(Icons.info),
        backgroundColor: Color(0xffccffdd),
      ),
    );
  }
}

class Info extends StatefulWidget {
  final Report report;

  Info({this.report});

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.report.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffccffdd),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            color: Color(0xffe6ffee),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    DateFormat("dd-MM-yyyy").format(widget.report.date),
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    widget.report.text,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ]
            ),
          )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('info'),
        icon: Icon(Icons.info),
        backgroundColor: Color(0xffccffdd),
      ),
    );
  }
}
