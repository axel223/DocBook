class Medicine{
  String name;
  String strength;
  double amount;
  bool day;
  bool afternoon;
  bool night;
  int timePeriod;

  Medicine(this.name,this.strength,this.amount,this.day,this.afternoon,this.night,this.timePeriod);

//  List view(){
//    return [name,strength,amount,day,afternoon,night,timePeriod];
//  }

  Medicine.fromSnapshot(Map snapshot){
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