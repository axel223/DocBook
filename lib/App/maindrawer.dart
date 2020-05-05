import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DocBook/App/bookAppointment.dart';
import 'package:DocBook/App/chats.dart';
import 'package:DocBook/App/reports.dart';

// ignore: camel_case_types
class mainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width * 0.82,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color(0xff31A05E),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/l.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      "Axel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Axel223@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
//            ListTile(
//              leading: Icon(Icons.person),
//              title: Text(
//                "Profile",
//                style: TextStyle(
//                  fontSize: 18,
//                ),
//              ),
//              onTap: null,
//            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text(
                "Prescription",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecentReports()));
              },            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Book Appointments",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookAppointment()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text(
                "Get Help",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecentChats()));
              },
            ),
//            ListTile(
//              leading: Icon(Icons.settings),
//              title: Text(
//                "Settings",
//                style: TextStyle(
//                  fontSize: 18,
//                ),
//              ),
//              onTap: null,
//            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: null,
            )
          ],
        ),
      ),
    );
  }
}
