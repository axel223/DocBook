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

  Medicine.fromSnapshot(DocumentSnapshot snapshot){
    medID=snapshot.reference;
    name=snapshot['name'];
    strength=snapshot['strength'];
    amount=snapshot['amount'];
    day=snapshot['day'];
    afternoon=snapshot['afternoon'];
    night=snapshot['night'];
    timePeriod=snapshot['timePeriod'];
  }

  toJson(){
    return{
      'name':name,
      'strength':strength,
      'amount':amount,
      'day':day,
      'afternoon':afternoon,
      'night':night,
      'timePeriod':timePeriod
    };
  }


}