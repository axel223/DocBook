import 'dart:convert';

import 'package:DocBook/Backend/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_test/flutter_test.dart';

function(DocumentSnapshot value){
  if(value.exists){
    print('success');
  }
  else{
    print('error');
  }
}


void main(){
  test('description', ()  {
    TestWidgetsFlutterBinding.ensureInitialized();
    print(formatDate(new DateTime.now(), [yyyy,'-',mm,'-',dd,',',hh,':',nn,':',ss]));
    Patient P = new Patient('registerID', 'avneesh', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('registerID', 'aditya', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('registerID', 'atif', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('registerID', 'avinash', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));

  });
}