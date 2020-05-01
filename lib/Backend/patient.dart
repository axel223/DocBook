import 'package:cloud_firestore/cloud_firestore.dart';

class Patient{
  int registerId;
  String name;
  String address;
  String phone;
  String email;
  String sex;
  DateTime dob;
  String bloodGroup;
  DocumentReference patientReference;

  Patient(this.registerId,this.name,this.address,this.phone,this.email,this.sex,this.dob,this.bloodGroup);

  List view(){
    return [registerId,name,address,phone,email,sex,dob,bloodGroup];
  }
  void update(String name,String address,String phone,String email,String sex,DateTime dob,String bloodGroup){
    this.name=name;
    this.address=address;
    this.phone=phone;
    this.email=email;
    this.sex=sex;
    this.dob=dob;
    this.bloodGroup=bloodGroup;
  }

  Patient.fromSnapshot(DocumentSnapshot snapshot){
    patientReference=snapshot.reference;
    this.name=snapshot.data['name'];
    this.address=snapshot.data['address'];
    this.phone=snapshot.data['phone'];
    this.email=snapshot.data['email'];
    this.sex=snapshot.data['sex'];
    this.dob=snapshot.data['dob'];
    this.bloodGroup=snapshot.data['bloodGroup'];
  }

  toJson(){
    return {
      'name':name,
      'address':address,
      'phone':phone,
      'email':email,
      'sex':sex,
      'dob':dob,
      'bloodGroup':bloodGroup
    };
  }
}
