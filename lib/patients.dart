import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'adaptive.dart';

enum ListDemoType {
  oneLine,
  twoLine,
}


class ListDemo extends StatelessWidget {
  const ListDemo({Key key, this.type}) : super(key: key);

  final ListDemoType type;

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: Text(
                      "Patient",
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
                    child: Text(
                      "Diagnosis",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                SizedBox(width: 120,),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 130.0,
                    child: Text(
                      "Date Visited",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF010E74),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                SizedBox(width: 100,),
              ],
            ),
          ) : SizedBox(height: 0,),
          Expanded(
              child :ListView(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                children:
                [
                  for (int index = 1; index < 21; index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(radius:30, child: Text('$index')),
                      ),
                      onTap:(){
                        print(index);
                      },
                      title: Text( "list [index].name",style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                      subtitle: Text("Secondary",style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      )),
                      trailing: isDesktop ? Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          Container(
                            width : 150,
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "diagnosis",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          SizedBox(width: 100,),
                          Container(
                            width : 100,
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "date",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          SizedBox(width: 100,),
                        ],
                      ) : null,
                    ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
