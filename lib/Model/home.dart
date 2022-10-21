import 'dart:convert';

import 'package:ezzproject/Model/Helper.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Home_model{
 static gethomedata()async{
    if (await InternetConnectionChecker().hasConnection) {
      var url = Helper.base_url+"home";

      var token = sharedPreferences.getString("token");
      var response = await http.get(
          Uri.parse(url), headers: {'Authorization': 'Bearer $token',});

      var body = jsonDecode(response.body);
      var url1 = Helper.base_url+"appInfo";
      var response1 = await http.get(Uri.parse(url1));
      var body1 = jsonDecode(response1.body);
      var categories = body["categories"]["cats"];
      var ad = body["categories"]["ads"];
      var banner = body["categories"]["banners"];
      return {"cart":body["categories"]["cart"],"categories":categories,"ad" : ad ,"banner" :banner , "adtime" : body1["categories"]["ads_time"].toString() };
    }
    else{
      Get.defaultDialog(title: "no_internet_connection");
    }
  }
  static getfav()async{
    if (await InternetConnectionChecker().hasConnection) {
      var url = Helper.base_url+"fav";
      var token = sharedPreferences.getString("token");
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });
      var body = jsonDecode(response.body);
      return body["fav"];
    }
    else{
      Get.defaultDialog(title: "no_internet_connection");
    }
  }
  static getmyorders() async{
    if (await InternetConnectionChecker().hasConnection) {
      var token = sharedPreferences.getString("token");
      var url2 = Helper.base_url+"myOrder";
      var response2 = await http.get(Uri.parse(url2), headers: {
        'Authorization': 'Bearer $token',
      });
      var body2 = jsonDecode(response2.body);
      var data = body2["data"];
      return data;
    }
    else{
      Get.defaultDialog(title: "no_internet_connection");
    }
  }
  static getprofiledata()async{
    if (await InternetConnectionChecker().hasConnection) {
    var token = sharedPreferences.getString("token");
    var url2 = Helper.base_url+"Data-Edit-User";
    var response2 = await http.get(Uri.parse(url2), headers: {
    'Authorization': 'Bearer $token',
    });
    var body2 = jsonDecode(response2.body);
    var profiledata = body2["data"];
    return {"profiledata": profiledata};
    }
    else{
      Get.defaultDialog(title: "no_internet_connection");
    }
  }
}