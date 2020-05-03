import 'package:cloud_firestore/cloud_firestore.dart';

class Patient{
  String registerID;
  String name;
  String address;
  String phone;
  String email;
  String sex;
  String dob;
  String bloodGroup;
  String imageURL;
  DocumentReference patientReference;

  Patient(this.registerID,this.name,this.address,this.phone,this.email,this.sex,this.dob,this.bloodGroup);

//  List view(){
//    return [registerId,name,address,phone,email,sex,dob,bloodGroup];
//  }
  void update(String name,String address,String phone,String sex,String dob,String bloodGroup,String imageURL){
    this.name=name;
    this.address=address;
    this.phone=phone;
    this.sex=sex;
    this.dob=dob;
    this.bloodGroup=bloodGroup;
    this.imageURL=imageURL;
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
    this.imageURL=snapshot.data['imageURL'];
  }

  toJson(){
    return {
      'name':name,
      'address':address,
      'phone':phone,
      'email':email,
      'sex':sex,
      'dob':dob,
      'bloodGroup':bloodGroup,
      'imageURL':imageURL
    };
  }
}
