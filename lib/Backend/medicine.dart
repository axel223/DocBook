import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine{
  String name;
  String strength;
  double amount;
  bool day;
  bool afternoon;
  bool night;
  int timePeriod;
  DocumentReference medID;

  Medicine(this.name,this.strength,this.amount,this.day,this.afternoon,this.night,this.timePeriod);

  List view(){
    return [name,strength,amount,day,afternoon,night,timePeriod];
  }


}