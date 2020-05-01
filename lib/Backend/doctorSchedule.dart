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
}