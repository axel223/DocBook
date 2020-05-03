import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'adaptive.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

enum Departments { Production, Research, Purchasing, Marketing, Accounting }

class _SchedulePageState extends State<SchedulePage>{

  final int noOfElements = 25;
  DateTime _dateTime ;

Future<Departments> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Departments>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Production);
              },
              child: Text('Reshedule' , style: GoogleFonts.poppins(color: Colors.black),),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Research);
              },
              child: Text('Cancel Schedule',style: GoogleFonts.poppins(color: Colors.black),),
            ),
          ],
        );
      });
}

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        children:
        [
          for (int index = 1; index < noOfElements; index++)
          ListTile(
            title: Text( "Scedule",style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
            subtitle: Text( "date",style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            )),
            trailing: isDesktop ? Wrap(
              spacing: 12, // space between two icons
              children: <Widget>[
                Container(
                  width : 150,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon:Icon(Icons.event),
                    onPressed: ()
                    {
                      showDatePicker(context: context,
                        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2021),
                      ).then((date) {
                        setState(() {
                          if (date != null)
                            _dateTime = date;                                               ///////////////////////date changes here
                        });
                      });
                    },
                    ),
                ),
                SizedBox(width: 100,),
                Container(
                  width : 100,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon : Icon(Icons.event_busy),
                    onPressed: (){
                        print("cancsiiil " + index.toString());
                    },
                  ),
                ),
                SizedBox(width: 100,),
              ],
            ) :
            Container(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child: IconButton(
                  icon : Icon(Icons.more_horiz),
                  onPressed: (){
                    _asyncSimpleDialog(context);
                  },
              ),
            ),
          ),
        ],
      )
    );
  }
}
