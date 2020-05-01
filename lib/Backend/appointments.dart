import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments{
  String sicknessDescription;
  DocumentReference apID;
  DateTime date;
  int time;
  bool completionStatus;

  Appointments(this.sicknessDescription,this.date,this.time,{this.completionStatus=false});

  List view(){
    return [sicknessDescription,date,time,completionStatus];
  }

  void reSchedule(DateTime date,int time){
    this.date=date;
    this.time=time;
  }

  void statusUpdate(){
    completionStatus=true;
  }

  Appointments.fromSnapshot(DocumentSnapshot snapshot){
    apID=snapshot.reference;
    sicknessDescription=snapshot.data['sicknessDescription'];
    date=snapshot.data['date'];
    time=snapshot.data['time'];
    completionStatus=snapshot.data['completionStatus'];
  }

  toJson(){
    return{
      'sicknessDescription':sicknessDescription,
      'date':date,
      'time':time,
      'completionStatus':completionStatus
    };
  }
}