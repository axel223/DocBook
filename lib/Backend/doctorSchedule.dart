import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorSchedule{
  List timeSlots;
  String date;
  DocumentReference schReference;

  DoctorSchedule(this.timeSlots,this.date);

//  List view(){
//    return [timeSlots,date];
//  }

  void add(int time){
    timeSlots.add(time);
  }

  void delete(int time){
    timeSlots.remove(time);
  }

  DoctorSchedule.fromSnapshot(DocumentSnapshot snapshot){
    schReference=snapshot.reference;
    date=snapshot.data['date'];
    timeSlots=snapshot.data['timeSlots'];
  }

  Map toJson(){
    return{
      'date':date,
      'timeSlots':timeSlots
    };
  }
}