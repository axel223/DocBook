import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments{
  String sicknessDescription;
  DocumentReference apID;
  DateTime date;
  int time;
  bool feeStatus;

  Appointments(this.sicknessDescription,this.date,this.time,{this.feeStatus=false});

  List view(){
    return [sicknessDescription,date,time,feeStatus];
  }

  void reSchedule(DateTime date,int time){
    this.date=date;
    this.time=time;
  }

  void feeUpdate(){
    feeStatus=true;
  }

}