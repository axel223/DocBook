import 'dart:convert';

import 'package:DocBook/Backend/doctorSchedule.dart';
import 'package:DocBook/Backend/medicine.dart';
import 'package:DocBook/Backend/patient.dart';
import 'package:DocBook/Backend/prescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';


void main(){
  test('description', ()  {
    TestWidgetsFlutterBinding.ensureInitialized();
    Prescription prescription=new Prescription('illness', 99.8, 145, new DateTime.now(), 'suggestedTest');
    prescription.addMedicines('name', 'strength', 1, true, true, false, 2);
    prescription.addMedicines('para', '1 mg', 1, true, true, false, 2);
    prescription.addReports('testType', new DateTime.now(), 'reportURL');
    prescription.addReports('testTypefwf', new DateTime.now(), 'reportURL46');
//    prescription.convertList();
    print(jsonEncode(prescription));
//    Medicine m=new Medicine('name', 'strength', 1, true, true, false, 2);
//    print(jsonEncode(m));
//    DoctorSchedule doctorSchedule=new DoctorSchedule([1,2],new DateTime.now().toUtc());
//    print(jsonEncode(doctorSchedule));
//    MockCloudFirestore mcf = MockCloudFirestore('trial');

  });
}