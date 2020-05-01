import 'package:cloud_firestore/cloud_firestore.dart';

class Inquiry{
  DocumentReference inqID;
  String subject;
  DateTime timeStamp;
  int priority;
  String description;
  String solution;

  Inquiry(this.subject,this.timeStamp,this.priority,this.description,{this.solution});

  List view(){
    return [subject,timeStamp,priority,description,solution];
  }

  void provideSolution(String solution){
    this.solution=solution;
  }
}