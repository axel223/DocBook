import 'package:DocBook/Backend/appointments.dart';
import 'package:DocBook/Backend/firestoreService.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'adaptive.dart';
class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  DateTime _dateTime = DateTime.now(); //date for which these inputs will be given
  /////////////////////////inputs///////////////////////////////////////////////////////////
  double startTimeHour = 9;
  double endTimeHour = 20;
  var appoint = [1,2,3,4];
  var hourList = [1,3,3,4];
  var userList = ['user1','user2','user3','user4'];
  var slotList = ["9:00 - 10:00","10:00 - 12:00","12:00 - 3:00","3:00 - 7:00"];
  var userAvatarList = [
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
  ];
  ////////////////////////////////////////////////////////////////////////////////////////

  String slotChooser(int dataTime){
    switch(dataTime){
      case 9: return "9:00 - 10:00";
      case 10: return "10:00 - 11:00";
      case 11: return "11:00 - 12:00";
      case 12: return "12:00 - 13:00";
      case 13: return "13:00 - 14:00";
      case 14: return "14:00 - 15:00";
      case 15: return "15:00 - 16:00";
      case 16: return "16:00 - 17:00";
      case 17: return "17:00 - 18:00";
      case 18: return "18:00 - 19:00";
      default: return "something went wrong";
      // assumed no appointments after 18:00 - 19:00 slot
    }
  }


  ///////////////Async Function /////////////////////////////////////////////

  Future<void> _getData(String date) async{
    List<Appointments> s = await new FirestoreService().appoitnmentPage(date);
    appoint = new List();
    hourList = new List();
    userList = new List();
    slotList = new List();
    userAvatarList = new List();
    for(var e in s){
      appoint.add(e.time);
      hourList.add(1);
      userList.add(e.patientEmail);
      slotList.add(slotChooser(e.time));
      userAvatarList.add(Icon(Icons.person));
    }
  }

  /////////////////////////////////////////////////////////////////////////////////

  var list = [];
  Widget background(BuildContext context){
    for(int i = startTimeHour as int ; i < endTimeHour.toInt() ; i++ ) {
      list.add(i.toString());
    }
    return Container(
      child: Column(children: <Widget>[
        for (String title in list) ...[
          _TimeCard(string:title,),
        ]
      ],
      ),
    );
  }
  
  Widget date(BuildContext context){
    return Container(
      height: 30,
      padding: EdgeInsets.all(5),
      child: InkWell(
            child: Text(
              "${_dateTime.year.toString()}-${_dateTime.month.toString().padLeft(2,'0')}-${_dateTime.day.toString().padLeft(2,'0')}",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap:(){
              showDatePicker(context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
              ).then((date) {
                setState(() {
                  if (date != null)
                    _dateTime = date;
                  build(context);
                });
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    int elements = 10;
    double width =  (MediaQuery.of(context).size.width - 250)/elements;
    return Container(
      color: Colors.white,
      child: !isDesktop ?
      SingleChildScrollView(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              date(context),
              FutureBuilder(
              future: _getData(formatDate(_dateTime, [yyyy,'-',mm,'-',dd])),
                  builder:(BuildContext context,snapshot) {
                    if(snapshot.connectionState==ConnectionState.done) {
                      return Timeline(
                        children: <Widget>[
                          for (int i = 0; i < hourList.length; i++) ...[
                            _CardMobile(string: slotList[i],
                              height: hourList[i].toDouble() * 50,),
                          ]
                        ],
                        indicators: <Widget>[
                          for (int i = 0; i < userAvatarList.length; i++) ...[
                            userAvatarList[i],
                          ]
                        ],
                      );
                    }
                    else{
                      return JumpingDotsProgressIndicator(fontSize: 60.0,);
                    }
                  }
              )
            ],
          )
      )
          : Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            date(context),
            FutureBuilder(
                future: _getData(formatDate(_dateTime, [yyyy,'-',mm,'-',dd])),
                builder:(BuildContext context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.done) {
                    return Expanded(
                      child: SingleChildScrollView(
                          child: Stack(children: <Widget>[
                            background(context),
                            for(int i = 0; i < userAvatarList.length; i++) ...[
                              _TopDesktop(string: userList[i],
                                top: 33 + 65 * (appoint[i].toDouble() -
                                    startTimeHour),
                                left: 80 + width * i,
                                elements: elements,
                                hours: hourList[i].toDouble(),)
                            ],
                          ],
                          )
                      ),
                    );
                  }
                  else{
                    return JumpingDotsProgressIndicator(fontSize: 60.0,);
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
class _TimeCard extends StatelessWidget {
  const _TimeCard({
    Key key,
    this.string,
  }) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: double.infinity),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 30,),
          Text(
            string,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
            SizedBox(width: 30,),
            Expanded(
              child: Container(
                height: 1,
                color: Color(0xFFEFEFEF),
              ),
            ),
            SizedBox(width: 20,)
        ],),
      );
  }
}

class _CardMobile extends StatelessWidget {
  const _CardMobile({
    Key key,
    this.string,
    this.height,
  }) : super(key: key);

  final String string;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.amberAccent,
      ),
      child: Text(
        string,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _CardDesktop extends StatelessWidget {
  const _CardDesktop({
    Key key,
    @required this.string,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final String string;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.amberAccent,
      ),
      child: Text(
        string,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _TopDesktop extends StatelessWidget {
  const _TopDesktop({
    Key key,
    @required this.string,
    @required this.top,
    @required this.left,
    @required this.elements,
    @required this.hours,
  }) : super(key: key);

  final String string;
  final double top;
  final double left;
  final int elements;
  final double hours;
  @override
  Widget build(BuildContext context) {
    double desktopWidth =  MediaQuery.of(context).size.width - 250;
    return Positioned(
      top: top,
      left: left,
      child:_CardDesktop(string: string,height:  65*hours ,width: desktopWidth/elements,),
    );
  }
}


class Timeline extends StatelessWidget {
  const Timeline({
    @required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget> indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];

        Widget indicator;
        if (indicators != null) {
          indicator = indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorColor,
    @required this.indicatorStyle,
    @required this.indicatorSize,
    @required this.lineGap,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemGap,
  })  : linePaint = Paint()
    ..color = lineColor
    ..strokeCap = strokeCap
    ..strokeWidth = strokeWidth
    ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}