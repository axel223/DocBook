import 'package:cloud_firestore/cloud_firestore.dart';

class Inquiry{
  DocumentReference inqReference;
  String subject;
  String timeStamp; //primary Key
  int priority;
  String description;
  String solution;

  Inquiry(this.subject,this.timeStamp,this.priority,this.description,{this.solution});

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
  }

  toJson(){
    return {
      'subject': subject,
      'timeStamp':timeStamp,
      'priority':priority,
      'description':description,
      'solution':solution
    };
  }
}