class LabReport{
  String testType;
  String timeStamp;
  String reportURL;

  LabReport(this.testType,this.timeStamp,this.reportURL);

//  List view(){
//    return [testType,timeStamp,reportURL];
//  }

  LabReport.fromJson(Map snapshot){
    testType=snapshot['testType'];
    timeStamp=snapshot['timeStamp'];
    reportURL=snapshot['reportURL'];
  }

  toJson(){
    return{
      'testType':testType,
      'timeStamp':timeStamp,
      'reportURL':reportURL
    };
  }
}