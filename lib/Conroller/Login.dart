
import 'package:ezzproject/Model/Login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login_controller extends GetxController{
  TextEditingController phone = TextEditingController() ;
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>() ;


  String validate(String value) {
    if (value.isEmpty) {
      return 'لا يجب ترك الحقل';
    }
    return null;
  }
  void savedata(token, name, phone, password, email, re1, re2, re3 ,id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("phone", phone);
    sharedPreferences.setString("password", password);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("region1", re1);
    sharedPreferences.setString("region2", re2);
    sharedPreferences.setString("region3", re3);
    sharedPreferences.setString(
        "id", id);
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
  alertwait() {
    Get.dialog(
         AlertDialog(backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(width: 30, height: 30,
            child: Center(child: SizedBox(
                width: 30, height: 30, child: CircularProgressIndicator()))),
      ), barrierDismissible: false);

  }

  static final FirebaseMessaging fire = FirebaseMessaging.instance;
  void login() async {
    if (key.currentState.validate()) {
      alertwait();
      fire.getToken().then((value)async {
        var response = await Loginmodel.login(phone, password,value);
        if (response['status'] == true) {
          savedata(
              response["data"]["API_Key"],
              response["data"]["Name"],
              response["data"]["PhoneNumber"].toString(),
              password,
              phone,
              response["data"]["Governorate"].toString(),
              response["data"]["City"].toString(),
              response["data"]["Region"].toString(),
              response["data"]["ID"].toString());
          Get.offAllNamed("home");


        }
        else {
          if(Get.isDialogOpen){
            Get.back();
          }
          Get.defaultDialog( title: "Warning!",content: response['msg']);
        }
      });
    }

  }
}