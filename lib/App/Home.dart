import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DocBook/App//maindrawer.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xfff5f7f9),
        accentColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          body1: TextStyle(
            fontSize: 15,
            color: Color(0xfffbfafa),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: mainDrawer(),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 15.0, bottom: 15,top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hi, Axel!",
                  style: Theme.of(context).textTheme.title,
                ),
                Text("Tuesday, Jun 20",style: GoogleFonts.poppins(fontSize: 15,color: Colors.black),),
                SizedBox(height: 30,),
                Text(
                    "UPCOMING APPOINTMENTS",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )
                ),
                SizedBox(height: 10,),
                Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AppointmentCard(),
                      AppointmentCard(),
                      AppointmentCard(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                    "MY MEDICINES",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )
                ),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      MedecineContainer(),
                      MedecineContainer(),
                      MedecineContainer(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                    "MESSAGES",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )
                ),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    MessagesCard(
                      color: Colors.blue,
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                    MessagesCard(
                      color: Colors.blue,
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                    MessagesCard(
                      color: Colors.blue,
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(15.0),
      width: 245,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xff31A05E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Consulting Doctor"),
          SizedBox(
            height: 21,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/dr.jpg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dr. Stephen Strange",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                    Text(
                      "Clinical Medicine",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tommorow",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "03:30PM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MedecineContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.all(15.0),
      width: 210,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff31A05E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Morning"),
          SizedBox(
            height: 21,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(
                    "assets/images/pill.png",
                  ),
                  backgroundColor: Colors.transparent,
                ),


                SizedBox(
                  width: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Colpol",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      "2 pills",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            ],
          ),
          ),

          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(
                    "assets/images/pill.png",
                  ),
                  backgroundColor: Colors.transparent,
                ),


                SizedBox(
                  width: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Brophine",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "2 pills",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(
                    "assets/images/pill.png",
                  ),
                  backgroundColor: Colors.transparent,
                ),


                SizedBox(
                  width: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Cobadex",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "2 pills",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesCard extends StatelessWidget {
  final Color color;
  final Icon icon;

  const MessagesCard({Key key, this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey[300], blurRadius: 3.0, offset: Offset(0, 1))
      ]),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Appointment Reminder",
                        style: TextStyle(color: Color(0xff747D88)),
                      ),
                      Spacer(),
                      Text("10:00"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Appointment with Dr. Strange",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffb2b5be)),
                      ),
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
