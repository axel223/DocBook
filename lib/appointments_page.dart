import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'adaptive.dart';
class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  final color = Colors.cyan;
  Widget background(BuildContext context){
    return Container(
      child: Column(children: <Widget>[
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
        _TimeCard(string: "9:00 AM"),
      ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    double desktopWidth =  MediaQuery.of(context).size.width - 150;
    int elements = 4;
    var hour_list = [1,2,3,4];
    return Container(
      color: Colors.white,
      child: !isDesktop ?
      Timeline(
        children: <Widget>[
          _CardMobile(string: "9:00 - 10:00 AM", height: 50,),
          _CardMobile(string: "10:00 - 12:00 AM", height: 100,),
          _CardMobile(string: "12:00 - 3:00 AM", height: 150,),
          _CardMobile(string: "3:00 - 7:00 AM", height: 200,),
        ],
        indicators: <Widget>[
          Icon(Icons.person),
          Icon(Icons.person),
          Icon(Icons.person),
          Icon(Icons.person),
        ],
      )
          : SingleChildScrollView(
          child : Stack(children: <Widget>[
            background(context),
            Positioned(
              top: 33,
              left: 80,
              child:_CardDesktop(string: "hello",height: 64,width: desktopWidth/elements,),
            ),
            Positioned(
              top: 33.0 + 64.0,
              left: 80 + desktopWidth/elements,
              child:_CardDesktop(string: "hello2",height:  64*elements.toDouble() ,width: desktopWidth/elements,),
            ),

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