import 'dart:convert';

import 'package:DocBook/Backend/labReport.dart';
import 'package:DocBook/Backend/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Prescription{
  DocumentReference prescriptionReference;
  String illness;
  double bodyTemperature;
  double bloodPressure;
  String timeStamp;  //will be used as primary key
  String suggestedTest;
  List medicines;
  List reports;

  Prescription(this.illness,this.bodyTemperature,this.bloodPressure,this.timeStamp,this.suggestedTest);

//  List view(){
//    return [illness,bodyTemperature,bloodPressure,timeStamp,suggestedTest,medicines,reports];
//  }

  void addMedicines(String name,String strength,double amount,bool day,bool afternoon,bool night,int timePeriod){
    Medicine med=new Medicine(name,strength,amount,day,afternoon,night,timePeriod);
    if(medicines==null) medicines=new List();
    medicines.add(med);
  }

  void addReports(String testType,String timeStamp,String reportURL){
    LabReport lab = new LabReport(testType, timeStamp, reportURL);
    if(reports==null) reports = new List();
    reports.add(lab);
  }

  _convertList(){
    medicines=this.medicines!=null?this.medicines.map((e) => e.toJson()).toList():null;
    reports=this.reports!=null?this.reports.map((e) => e.toJson()).toList():null;
  }

  Prescription.fromSnapshot(DocumentSnapshot snapshot){
    prescriptionReference = snapshot.reference;
    illness = snapshot['illness'];
    bodyTemperature = snapshot['bodyTemperature'];
    bodyTemperature = snapshot['bloodPressure'];
    timeStamp = snapshot['timeStamp'];
    suggestedTest = snapshot['suggestedTest'];
    var medicinesJson = snapshot['medicines'];
    var reportsJson = snapshot['reports'];
    if (medicinesJson != null) {
      medicines = new List();
      for (var med in medicinesJson) {
        Medicine medicine = new Medicine.fromSnapshot(jsonDecode(med));
        medicines.add(medicine);
      }
    }
    if (reportsJson != null) {
      reports = new List();
      for (var rep in reportsJson) {
        LabReport labReport = new LabReport.fromJson(jsonDecode(rep));
        reports.add(labReport);
      }
    }
  }

  toJson(){
    _convertList();
    return{
      'illness':illness,
      'bodyTemperature':bodyTemperature,
      'bloodPressure':bloodPressure,
      'timeStamp':timeStamp,
      'suggestedTest':suggestedTest,
      'medicines':medicines,
      'reports':reports
    };
  }

}