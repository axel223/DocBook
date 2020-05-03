import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'adaptive.dart';


class Patient extends StatelessWidget {
  Patient({this.patientId});
  final int patientId;

  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
//      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Details',style: GoogleFonts.poppins(color: Colors.black),),
          content: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Medication', hintText: 'eg. Paracitamol'),
                      onChanged: (value) {
                        teamName = value;
                      },
                    ),
                    TextField(
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Daignosis', hintText: 'eg. Common Cold'),
                      onChanged: (value) {
                        teamName = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(teamName);               ///////////////////////add prescription function///////////
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Patient Name",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          isDesktop ? Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(30, 20, 30, 3) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0XFFEFF9FF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 50,),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 150.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Diagnosis",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 150.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Date Visited",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                SizedBox(width: 80,),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 170.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Medication/Report",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                SizedBox(width: 90,),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 130.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Actions",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                SizedBox(width: 80,),
              ],
            ),
          ) : SizedBox(height: 0,),
          Expanded(
              child :ListView(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                children: <Widget>[
                  for (int index = 1; index < 21; index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(radius:30, child: Text('$index')),
                      ),
                      onTap:(){
                        print(index);
                      },
                      title: Text( "list [index].",style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                      subtitle: !isDesktop ? Text( "date",style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )) : null,
                      trailing: isDesktop ? Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          SizedBox(width: 50,),
                          Container(
                            width : 150,
                            alignment: Alignment.center,
                            child: Text(
                                "diagnosis",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          SizedBox(width: 80,),
                          Container(
                            width : 170,
                            alignment: Alignment.center,
                            child: Text(
                                "date",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          SizedBox(width: 90,),
                          Container(
                            width : 130,
                            alignment: Alignment.center,
                            child: Text(
                                "diagnosis",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          SizedBox(width: 80,)
                        ],
                      ) : null,
                    ),
                ],
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _asyncInputDialog(context);
        },
      ),
    );
  }
}
