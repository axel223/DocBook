import 'package:DocBook/Backend/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'adaptive.dart';
import 'patient.dart';

class PatientView extends StatefulWidget {
  @override
  _PatientViewState createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {



  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Patient').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return JumpingDotsProgressIndicator(fontSize: 60.0,);

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.all(4.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final isDesktop = isDisplayDesktop(context);
    final P = Patient.fromSnapshot(data);

    return Padding(
        key: ValueKey(P.name),
        padding: EdgeInsets.all(4.0),
      child:ListTile(
          leading: ExcludeSemantics(
            child: CircleAvatar(radius: 30, child: Text(
                P.name.substring(0, 0))),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientUI(P.email))
            );
          },
          title: Text(P.name, style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          )),
          subtitle: Text(P.email, style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          )),
          trailing: isDesktop ? Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Container(
                width: 150,
                alignment: Alignment.centerLeft,
                child: Text(
                    P.bloodGroup,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )
                ),
              ),
              SizedBox(width: 100,),
              Container(
                width: 100,
                alignment: Alignment.centerLeft,
                child: Text(
                    P.dob,
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
    );
  }

  @override
  Widget build(BuildContext context)  {
    final isDesktop = isDisplayDesktop(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
            children: <Widget>[
              isDesktop ? Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(30, 20, 30, 3),
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
                  child: _buildBody(context)
              ),
            ],
          ),
    );
  }
}
