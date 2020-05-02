import 'package:DocBook/Backend/labReport.dart';
import 'package:DocBook/Backend/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Prescription{
  DocumentReference prescriptionID;
  String illness;
  double bodyTemperature;
  double bloodPressure;
  DateTime timeStamp;
  String suggestedTest;
  List medicines;
  List reports;
  List medicineJson;
  List reportJson;

  Prescription(this.illness,this.bodyTemperature,this.bloodPressure,this.timeStamp,this.suggestedTest);

  List view(){
    return [illness,bodyTemperature,bloodPressure,timeStamp,suggestedTest,medicines,reports];
  }
  void addMedicines(String name,String strength,double amount,bool day,bool afternoon,bool night,int timePeriod){
    Medicine med=new Medicine(name,strength,amount,day,afternoon,night,timePeriod);
    if(medicines==null) medicines=new List();
    medicines.add(med);
  }

  void addReports(String testType,DateTime timeStamp,String reportURL){
    LabReport lab = new LabReport(testType, timeStamp, reportURL);
    if(reports==null) reports = new List();
    reports.add(lab);
  }

  convertList(){
    medicineJson=this.medicines!=null?this.medicines.map((e) => e.toJson()).toList():null;
    medicineJson=this.reports!=null?this.reports.map((e) => e.toJson()).toList():null;
  }


  toJson(){
    convertList();
    return{
      'illness':illness,
      'bodyTemperature':bodyTemperature,
      'bloodPressure':bloodPressure,
      'timeStamp':timeStamp.toIso8601String(),
      'suggestedTest':suggestedTest,
      'medicines':medicineJson,
      'reports':reports
    };
  }

}