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

  Prescription(this.illness,this.bodyTemperature,this.bloodPressure,this.timeStamp,this.suggestedTest);

  List view(){
    return [illness,bodyTemperature,bloodPressure,timeStamp,suggestedTest,medicines,reports];
  }
  void addMedicines(String name,String strength,double amount,bool day,bool afternoon,bool night,int timePeriod){
    Medicine med=new Medicine(name,strength,amount,day,afternoon,night,timePeriod);
    medicines.add(med);
  }

  void addReports(String testType,DateTime timeStamp,String reportURL){
    LabReport lab = new LabReport(testType, timeStamp, reportURL);
    reports.add(lab);
  }

}