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

  LabReport.fromJson(DocumentSnapshot snapshot){
    repID=snapshot.reference;
    testType=snapshot['testType'];
    timeStamp=snapshot['timeStamp'];
    reportURL=snapshot['reportURL'];
  }

  toJson(){
    return{
      'testType':testType,
      'timeStamp':timeStamp.toIso8601String(),
      'reportURL':reportURL
    };
  }
}