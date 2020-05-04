import 'package:cloud_firestore/cloud_firestore.dart';

class PatientAppointments{
  String email;
  String bookTime;
  DocumentReference paID;
  PatientAppointments(this.email,this.bookTime);

  PatientAppointments.fromJson(DocumentSnapshot snapshot){
    email=snapshot['email'];
    bookTime=snapshot['bookTime'];
  }

  toJson(){
    return {
      'email': email,
      'bookTime': bookTime
    };
  }
}