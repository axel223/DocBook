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
    Patient P = new Patient( 'avneesh', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('aditya', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('atif', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));
    P = new Patient('avinash', 'address', 'phone', 'email', 'sex', '28-05-2001', 'bloodGroup');
    print(jsonEncode(P));

  });
}