import 'package:ezzproject/Model/Login.dart';
import 'package:ezzproject/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class Loading_controller extends GetxController{

  static final FirebaseMessaging fire = FirebaseMessaging.instance;
  @override
  void onInit()async {
    fire.getToken().then((value)async {
      var phone =   sharedPreferences.getString("phone");
      var pass = sharedPreferences.getString("password");
    var response = await Loginmodel.login(phone, pass,value);
    if(response['status'] == true){
      Get.toNamed("home");
    }
    else{
      Get.toNamed("login");
    }});
    super.onInit();
  }
}