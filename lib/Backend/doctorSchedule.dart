import 'package:DocBook/Backend/inquiry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';

class DoctorSchedule{
  List timeSlots;
  DateTime date;
  DocumentReference schID;

  DoctorSchedule(this.timeSlots,this.date);

  List view(){
    return [timeSlots,date];
  }

  void add(int time){
    timeSlots.add(time);
  }

  void delete(int time){
    timeSlots.remove(time);
  }

  DoctorSchedule.fromSnapshot(DocumentSnapshot snapshot){
    schID=snapshot.reference;
    date=snapshot.data['date'];
    timeSlots=snapshot.data['timeSlots'];
  }

  Map toJson(){
    return{
      'date':formatDate(date, [yyyy,'-',mm,'-',dd]),
      'timeSlots':timeSlots
    };
  }
}