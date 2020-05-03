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
  });
}