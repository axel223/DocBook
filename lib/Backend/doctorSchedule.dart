import 'package:DocBook/Backend/inquiry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  toJson(){
    return{
      'date':date,
      'timeSlots':timeSlots
    };
  }
}