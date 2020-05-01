import 'package:cloud_firestore/cloud_firestore.dart';

class LabReport{
  String testType;
  DateTime timeStamp;
  String reportURL;
  DocumentReference repID;

  LabReport(this.testType,this.timeStamp,this.reportURL);

  List view(){
    return [testType,timeStamp,reportURL];
  }
}