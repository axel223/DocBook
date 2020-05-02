import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adaptive.dart';
class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  /////////////////////////inputs///////////////////////////////////////////////////////////
  var startTime = DateTime.parse("1969-07-20 09:00:04Z");
  var endTime = DateTime.parse("1969-07-20 21:00:04Z");
  var appoint = [9,10,12,15];
  var hourList = [1,2,3,4];
  var userList = ['user1','user2','user3','user4'];
  var slotList = ["9:00 - 10:00","10:00 - 12:00","12:00 - 3:00","3:00 - 7:00"];
  var userAvatarList = [
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
  ];
  ////////////////////////////////////////////////////////////////////////////////////////

  var list = [];
  Widget background(BuildContext context){
    while(startTime.isBefore(endTime))
    {
      String time = "${startTime.hour}:${startTime.minute}";
      list.add(time);
      startTime = startTime.add(Duration(hours: 1));
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

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    int elements = 4;
    double width =  (MediaQuery.of(context).size.width - 250)/elements;

    var sumHour = [];
    var tempSum = 0;

    for(int i=0;i<elements;i++){
      sumHour.add(tempSum);
      tempSum = tempSum + hourList[i];
    }

    return Container(
      color: Colors.white,
      child: !isDesktop ?
      Timeline(
        children: <Widget>[
          for (int i=0;i<elements;i++) ...[
            _CardMobile(string:slotList[i],height: hourList[i].toDouble() * 50,),
          ]
        ],
        indicators: <Widget>[for (int i=0;i<elements;i++) ...[
          userAvatarList[i],
        ]
        ],
      )
          : SingleChildScrollView(
          child : Stack(children: <Widget>[
            background(context),
            for(int i= 0 ; i < elements ;i++) ...[
              _TopDesktop(string: userList[i],
                top: 33 + 65 * sumHour[i],
                left: 80 + width * i,
                elements: elements,
                hours: hourList[i].toDouble(),)
              ],

            ],
          )
      )
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