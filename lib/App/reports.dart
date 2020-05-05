import 'package:flutter/material.dart';
import 'package:DocBook/App/report.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reportData.dart';
import 'package:intl/intl.dart';

class RecentReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffccffdd),
        title: Text(
          "Prescriptions",
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 31.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: reportList.length,
        itemBuilder: (BuildContext context, int index){
          final report = reportList[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => ReportScreen(report: report)
          )),
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//              decoration: BoxDecoration(
//                  color: chat.unread ? Color(0xFFe4f1fe) : Colors.white,
//                  borderRadius:BorderRadius.circular(15)
//              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage(report.patient.imageUrl),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            report.title,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45 ,
                            child: Text(
                              report.text,
                              style: GoogleFonts.poppins(
                                  color: Colors.blueGrey,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        DateFormat("dd-MM-yyyy").format(report.date),
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15.0,
                          //  fontWeight: FontWeight.bold
                        ),
                      ),
//                      chat.unread ?
//                      Container(
//                          width: 40.0,
//                          height: 20.0,
//                          decoration: BoxDecoration(
//                              color: Theme.of(context).primaryColor,
//                              borderRadius: BorderRadius.circular(30)
//                          ),
//                          alignment: Alignment.center,
//                          child: Text(
//                            'New',
//                            style: GoogleFonts.poppins(
//                                color: Colors.white,
//                                fontSize: 9.5,
//                                fontWeight: FontWeight.bold
//                            ),
//                          )
//                      ): SizedBox.shrink(),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}