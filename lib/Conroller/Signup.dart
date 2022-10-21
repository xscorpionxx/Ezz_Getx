import 'dart:io';

import 'package:ezzproject/Model/signup.dart';
import 'package:ezzproject/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Signup_controller extends GetxController{
  var stringa;
  String validateemail(String value) {
    if (value.length>8) {
      return null;
    }
    else {
      return "البريد الالكتروني خاطئ";
    }
  }

  String validatepassword(String value) {
    stringa = value;
    if (value.length < 6) {
      return 'كلمة السر يجب أن تكون أكثر من 6 خانات';
    }
    if (value.isEmpty) {
      return 'لا يمكن أن تكون كلمة السر فارغة';
    }
    return null;
  }

  String validatepasswordre(String value) {
    if (value != stringa) {
      return 'لا يوجد تطابق بين كلمتي السر';
    }
    return null;
  }

  String validatename(String value) {
    if (value.isEmpty) {
      return 'لا يمكن أن تبقي الاسم فارغ';
    }
    return null;
  }
  String validateid(String value) {
    if (value.isEmpty) {
      return 'لا يمكن أن تبقي رقم الهوية فارغ';
    }
    if (value.length !=10){
      return 'يجب أن يكون رقم الهوية مكون من 10 خانات';
    }
    return null;
  }
  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'لا يمكنك ترك الرقم فارغ!';
    }
    else if (!regExp.hasMatch("+966"+value)) {
      return 'هذا الرقم غير صالح!';
    }
    return null;
  }

  var type ;
  TextEditingController name ;
  TextEditingController storename ;
  TextEditingController id ;
  TextEditingController phone ;
  TextEditingController email ;
  TextEditingController password ;
  TextEditingController repassword ;
  GlobalKey<FormState> key;
  var region1 = "المنطقة" ;
  var region2 = "المحافظة" ;
  var region3 ="المدينة";
  List region1list =["المنطقة"];
  List region2list =["المحافظة"];
  var cat  ;
  var subcat;
  List cats  =[];
  List subcats =[];
  var value = false;
  List region3list =["المدينة"];
  List region1back =[];
  List region2back =[];
  List region3back =[];
  File photo;
  List regions =[];
  List citites = [];
  List subtypevalues = [];
  List subtypelist =[];
  var subtypevalue;
  chooseimage()async{
    Future.delayed(Duration(seconds: 2));
    var status =await Permission.camera.status;
    var takepermission =await Permission.camera.request();
    if(takepermission.isGranted){
      var image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image1 !=null) {
        photo = File(image1.path);
        update();
      }
    }
  }
  changevaluetype(ind){
      subtypelist = subtypevalues[ind][(ind + 1).toString()];
      subtypevalue = null;
      update();
  }
  getdata()async{
    var dataa = await Signup_model.getplaces();
    regions = dataa["1"];
    for(int f = 0 ; f<regions.length;f++){
      region1back.add({"name" :regions[f]["Name"],"ID" : regions[f]["ID"].toString()});
    }
    for(int i =0 ; i<region1back.length ; i++){
      region1list.add(region1back[i]["name"].toString());
    }
    cats = dataa["cat"];
    subtypevalues = dataa["subcats"];
    update();
  }
  slecetcity(name){
    region2back.clear();
    region2list.clear();
    region3back.clear();
    region3list.clear();
    for (int f = 0; f < regions.length; f++) {
      if (regions[f]["Name"].toString() == name.toString()) {
        citites = regions[f]["Cities"];
        for (int g = 0; g < regions[f]["Cities"].length; g++) {
          region2back.add({
            "name": regions[f]["Cities"][g]["Name"],
            "ID": regions[f]["Cities"][g]["ID"].toString()
          });
        }
      }
    }
    region2 = "المحافظة" ;
    region3 ="المدينة";
    region2list.add("المحافظة");
    region3list.add("المدينة");
    for (int i = 0; i < region2back.length; i++) {
      region2list.add(region2back[i]["name"].toString());
    }
   update();
  }
  selectgovern(name){
    region3back.clear();
    region3list.clear();
    for(int f =0 ; f<citites.length ; f++){
      if(citites[f]["Name"].toString() ==name.toString()) {
        for (int g = 0; g < citites[f]["Regions"].length; g++) {
          region3back.add({
            "name": citites[f]["Regions"][g]["Name"],
            "ID": citites[f]["Regions"][g]["ID"].toString()
          });
        }
      }
    }
    region3 ="المدينة";
    region3list.add("المدينة");
    for(int i =0 ; i<region3back.length ; i++){
      region3list.add(region3back[i]["name"].toString());
    }
    update();
  }
  @override
  void onInit() {
    getdata();
    key = new GlobalKey<FormState>();
    name = new TextEditingController();
    storename = new TextEditingController();
    id = new TextEditingController();
    phone = new TextEditingController();
    email = new TextEditingController();
    password = new TextEditingController();
    repassword = new TextEditingController();
    type =false;
    super.onInit();
  }
  void savedata(token ,name ,phone, password, email,re1,re2,re3)async{
    sharedPreferences.setString("token", token);
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("phone", phone);
    sharedPreferences.setString("password", password);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("region1", re1);
    sharedPreferences.setString("region2", re2);
    sharedPreferences.setString("region3", re3);
  }
  alertwait() {
    Get.dialog(
        AlertDialog(backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(width: 30, height: 30,
              child: Center(child: SizedBox(
                  width: 30, height: 30, child: CircularProgressIndicator()))),
        ), barrierDismissible: false);

  }
  final FirebaseMessaging fire = FirebaseMessaging.instance;
  signup() async{
    if (key.currentState.validate()) {
      fire.getToken().then((value_) async {
        alertwait();
          var res = await Signup_model.signup(type, email.text.toString(), password.text.toString(), repassword.text.toString(), name.text.toString(), phone.text.toString(), region1, region2, region3,region1back , region2back,region3back , storename.text ,id.text, photo, "ji" , cat,subtypevalue,value,value_);
        Get.back();
       if (res["status"] == true) {
         await savedata(
             res["data"]["API_Key"].toString(),
             name.text,
             phone.text,
             password.text,
             email.text,
             res["data"]["Governorate"],
             res["data"]["City"],
             res["data"]["Region"]);
         sharedPreferences.setString(
             "id", res["data"]["ID"].toString());
         Get.offAllNamed("home");
       }
       else {
         Get.defaultDialog(title: "warning" , content: res['msg']);
       }
      });
  }
      }


}