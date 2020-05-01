import 'package:DocBook/Backend/doctorSchedule.dart';
import 'package:DocBook/Backend/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';


void main(){
  test('description', ()  {
    TestWidgetsFlutterBinding.ensureInitialized();
    DoctorSchedule doctorSchedule=new DoctorSchedule([1,2],new DateTime.now().toUtc());
    MockCloudFirestore mcf = MockCloudFirestore('trial');
  });
}