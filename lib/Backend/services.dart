import 'package:DocBook/Backend/appointments.dart';
import 'package:DocBook/Backend/dialogService.dart';
import 'package:DocBook/Backend/doctorSchedule.dart';
import 'package:DocBook/Backend/firestoreService.dart';
import 'package:DocBook/Backend/inquiry.dart';
import 'package:DocBook/Backend/patient.dart';
import 'package:DocBook/Backend/prescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';

class Services {
  Prescription _prescription;
  Patient _patient;
  Inquiry _inquiry;
  Appointments _appointments;
  DoctorSchedule _doctorSchedule;

  Future searchPatient(String name) async {
    if (name == null || name.isEmpty) {
      return new FirestoreService().readData('Patient');
    }
    final CollectionReference _db = Firestore.instance.collection('Patient');
    var _documentList = await _db.getDocuments();
    if (_documentList.documents.isNotEmpty) {
      return _documentList.documents
          .map((e) => Patient.fromSnapshot(e))
          .where((element) => element.name == name)
          .toList();
    }
  }

  Future addPatient(String registerID,String name,String address,String phone,String email,String sex,String dob,String bloodGroup,String imageURL) async{
    if(imageURL==null||imageURL.isEmpty){
      imageURL='image';
    }
    _patient=new Patient(registerID, name, address, phone, email, sex, dob, bloodGroup);
    var s=new FirestoreService().addData(_patient, 'Patient');
    if(s is String){
      await new DialogService().showDialog(
        title: 'Error occurred in registration',
        description: s.toString()
      );
    }
    else{
      await new DialogService().showDialog(
        title: 'Patient registration Successful',
        description: 'You have been added to docBook database'
      );
    }
  }

  addPrescriptionDone() async{
    var s=new FirestoreService().addData(_prescription, 'Prescription');
    if(s is String){
      await new DialogService().showDialog(
          title: 'Could not add Prescription',
          description: s.toString()
      );
    }
    else{
      await new DialogService().showDialog(
          title: 'Prescription Added Successfully',
          description: 'Prescription have been added to docBook database'
      );
    }
  }

  addPrescription(String illness,double bodyTemperature,double bloodPressure,String suggestedTest){
    _prescription=new Prescription(illness, bodyTemperature, bloodPressure, formatDate(new DateTime.now(), [yyyy,'-',mm,'-',dd,',',hh,':',nn,':',ss]), suggestedTest);
  }

  addMedicine(String name,String strength,double amount,bool day,bool afternoon,bool night,int timePeriod){
    _prescription.addMedicines(name, strength, amount, day, afternoon, night, timePeriod);
  }

  addReport(String testType,String timeStamp,String reportURL){
    if(reportURL==null||reportURL.isEmpty)  reportURL='sampleReport';
    _prescription.addReports(testType, timeStamp, reportURL);
  }

  restorePrescription(DocumentSnapshot snapshot){
    _prescription=new Prescription.fromSnapshot(snapshot);
  }

  addInquiry(String subject,String timeStamp,int priority,String description) async{
    _inquiry=new Inquiry(subject, timeStamp, priority, description);
    var s= new FirestoreService().addData(_inquiry, 'Inquiry');
    if(s is String){
      await new DialogService().showDialog(
          title: 'Error occurred while raising your query, please try again after sometime',
          description: s.toString()
      );
    }
    else{
      await new DialogService().showDialog(
          title: 'Your concern has been sent to Doctor',
          description: 'Usually, replies take 4-5 hours, if urgent you can contact on call +91 588***'
      );
    }
  }
  addAppointments(String sicknessDescription,String bookTime,String date,int time,)async{
    _appointments=new Appointments(sicknessDescription, date, time, bookTime);
    var s= new FirestoreService().addData(_appointments, 'Appointments');
    if(s is String){
      await new DialogService().showDialog(
          title: 'Error occurred while scheduling appointment, Please try after some-time',
          description: s.toString()
      );
    }
    else{
      await new DialogService().showDialog(
          title: 'Your Appointment scheduled',
          description: 'Please be on time, try to come 10 min before scheduled slot, Treatment at clinic will be based on first-come-first-serve basis'
      );
    }
  }
}

// view Schedule is read Data

// view Appointment is read Data

