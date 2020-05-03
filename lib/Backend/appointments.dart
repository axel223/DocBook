import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments{
  String sicknessDescription;
  DocumentReference apReference;
  String bookTime; //Primary Key
  String date;
  int time;
  bool completionStatus;

  Appointments(this.sicknessDescription,this.date,this.time,this.bookTime,{this.completionStatus=false});

//  List view(){
//    return [sicknessDescription,date,time,completionStatus];
//  }

  void reSchedule(String date,int time){
    this.date=date;
    this.time=time;
  }

  void statusUpdate(){
    completionStatus=true;
  }

  Appointments.fromSnapshot(DocumentSnapshot snapshot){
    apReference=snapshot.reference;
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