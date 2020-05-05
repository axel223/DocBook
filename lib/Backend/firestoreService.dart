import 'package:DocBook/Backend/appointments.dart';
import 'package:DocBook/Backend/doctorSchedule.dart';
import 'package:DocBook/Backend/inquiry.dart';
import 'package:DocBook/Backend/patient.dart';
import 'package:DocBook/Backend/prescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService{

  Future addData(obj,String type) async {
    try{
      final CollectionReference _objReference = Firestore.instance.collection(type);
      await _objReference.add(obj.toJson());
      return true;
    }
    catch (e){
      return e.toString();
    }
  }

  Future appoitnmentPage(String date) async {
    try{
      final CollectionReference _objReference = Firestore.instance.collection('Appointments');
      var documentLists = await _objReference.getDocuments();
      if (documentLists.documents.isNotEmpty) {
        return documentLists.documents
            .map((e) => Appointments.fromSnapshot(e))
            .where((element) => element.date==date)
            .toList();
      }
    }
    catch (e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

  Future prescriptionPage(String user) async {
    try{
      final CollectionReference _objReference = Firestore.instance.collection('Prescription');
      var documentLists = await _objReference.getDocuments();
      if (documentLists.documents.isNotEmpty) {
        return documentLists.documents
            .map((e) => Prescription.fromSnapshot(e))
            .where((element) => element.patientEmail==user)
            .toList();
      }
    }
    catch (e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

  Future readData(String type) async {
    try{
      final CollectionReference _objReference = Firestore.instance.collection(type);
      var documentLists = await _objReference.getDocuments();
      if (documentLists.documents.isNotEmpty) {
        if (type == 'Patient') {
          return documentLists.documents
              .map((e) => Patient.fromSnapshot(e))
              .toList();
        }
        else if (type == 'Prescription') {
          return documentLists.documents
              .map((e) => Prescription.fromSnapshot(e))
              .toList();
        }
         if (type == 'Appointments') {
          return documentLists.documents
              .map((e) => Appointments.fromSnapshot(e))
              .toList();
        }
        else if (type == 'DoctorSchedule') {
          return documentLists.documents
              .map((e) => DoctorSchedule.fromSnapshot(e))
              .toList();
        }
        else if (type == 'Inquiry') {
          return documentLists.documents
              .map((e) => Inquiry.fromSnapshot(e))
              .toList();
        }
      }
    }
    catch (e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

  Future updateData(DocumentReference reference,obj,String type) async {
    try {
      reference.setData(obj.toJson());
    }
    catch (e){
      return e.toString();
    }
  }
}
