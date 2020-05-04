import 'package:cloud_firestore/cloud_firestore.dart';

class Inquiry{
  DocumentReference inqReference;
  String subject;
  String timeStamp; //primary Key
  int priority;
  String description;
  String solution;
  String patientEmail;

  Inquiry(this.subject,this.timeStamp,this.priority,this.description,this.patientEmail,{this.solution});

//  List view(){
//    return [subject,timeStamp,priority,description,solution];
//  }

  void provideSolution(String solution){
    this.solution=solution;
  }

  Inquiry.fromSnapshot(DocumentSnapshot snapshot){
    inqReference=snapshot.reference;
    subject=snapshot.data['subject'];
    timeStamp=snapshot.data['timeStamp'];
    priority=snapshot.data['priority'];
    description=snapshot.data['description'];
    solution=snapshot.data['solution'];
    patientEmail=snapshot.data['patientEmail'];
  }

  toJson(){
    return {
      'subject': subject,
      'timeStamp':timeStamp,
      'priority':priority,
      'description':description,
      'solution':solution,
      'patientEmail':patientEmail
    };
  }
}