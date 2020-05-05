import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';  //add dependency in pubsec

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
  DateTime(2020, 5, 7): ['Buddha Purnima'],
  DateTime(2020, 5, 22): ['Jamat-ul-Vida'],
  DateTime(2020, 5, 25): ['Eid-ul-Fitar'],
  DateTime(2020, 6, 23): ['Rath Yatra'],
  DateTime(2020, 7, 21): ['Eid-ul-Adha/Bakr-eid'],
};

//void main() {
//  initializeDateFormatting().then((_) => runApp(BookAppointment()));
//}

class BookAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Docbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Book Appointment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    //Display event only under 1 month duration.
    _events = {
      _selectedDay: ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 5)): ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 3)): Set.from(['08:00am - 09:00am', '10:00am - 11:00am']).toList(),
      _selectedDay.add(Duration(days: 7)): ['08:00am - 09:00am', '10:00am - 10:30am', '10:30am - 11:30am',],
      _selectedDay.add(Duration(days: 11)): ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 17)): ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 22)): ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 26)): ['08:00am - 09:00am', '10:00am - 11:00am'],
      _selectedDay.add(Duration(days: 28)): ['08:00am - 09:00am', '10:00am - 11:00am'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTableCalendar(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Color(0xffccccff),
        todayColor: Color(0xff62CFDE),
        markersColor: Color(0xffA5D6A9),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Color(0xff31A05E),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff31A05E))),
      onPressed: () {},
      color: Colors.green,
      textColor: Colors.white,
      child: Text("Set Appointment".toUpperCase(),
          style: TextStyle(fontSize: 14)),
    );
  }



  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }
}

class CustomTile extends StatefulWidget {
  @override
  CustomTileState createState() => CustomTileState();
}

class CustomTileState extends State<CustomTile> {
  Color color;
  String title;

  @override
  void initState() {
    super.initState();

    color = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        title: Text(title),
        onTap: () {
          setState(() {
            color = Colors.lightGreenAccent;
          }
          );
        },
      ),
    );
  }
}