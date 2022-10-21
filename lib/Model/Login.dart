import 'dart:convert';
import 'package:ezzproject/Model/Helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Loginmodel {
  var contexta;

  Loginlogic(BuildContext context) {
    contexta = context;
  }

  String validate(String value) {
    if (value.isEmpty) {
      return 'لا يجب ترك الحقل';
    }
    return null;
  }


  void savedata(token, name, phone, password, email, re1, re2, re3) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
    showDialog(
        barrierDismissible: false, context: contexta, builder: (context) {
      return AlertDialog(backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(width: 30, height: 30,
            child: Center(child: SizedBox(
                width: 30, height: 30, child: CircularProgressIndicator()))),
      );
    });
  }
  static final FirebaseMessaging fire = FirebaseMessaging.instance;
  static login(phone, password ,value)async {
        if (await InternetConnectionChecker().hasConnection) {
          var data = {
            "phone": phone.toString(),
            "password": password.toString(),
            "fb_token": value.toString()
          };
          var url = Helper.base_url+"login";
          var response = await http.post(Uri.parse(url), body: data);
          var body = jsonDecode(response.body);
          return body;
        }
        else{
          if(Get.isDialogOpen) Get.back();
          Get.defaultDialog(title: "no_internet_connection");
        }
  }
}