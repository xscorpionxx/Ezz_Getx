import 'dart:convert';
import 'dart:io';

import 'package:ezzproject/Model/Helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http ;

List subcatego = [
  {"1": []},
  {"2": []},
  {"3": []},
  {"4": []},
  {"5": []},
  {"6": []},
  {"7": []},
  {"8": []},
  {"9": []},
  {"10": []}
];

List subcategoreis = [];
List categories = [];
List region1 =[];
List region2 =[];
List region3 =[];
class Signup_model{
  static getplaces()async{
    if(await InternetConnectionChecker().hasConnection) {
      var url = Helper.base_url+"places";
      var response = await http.get(Uri.parse(url));
      var body = jsonDecode(response.body);
      var url2 = Helper.base_url+"home";
      var response2 = await http.get(Uri.parse(url2));
      var body2 = jsonDecode(response2.body);
      List cats = [];
      List subcats = [
        {"1": []},
        {"2": []},
        {"3": []},
        {"4": []},
        {"5": []},
        {"6": []},
        {"7": []},
        {"8": []},
        {"9": []},
        {"10": []}
      ];
      categories = body2["categories"]["cats"];
      for (int g = 0; g < categories.length; g++) {
        if (categories[g]["Name"].toString() == "مزاد") {
          categories.removeAt(g);
        }
      }
      for (int g = 0; g < categories.length; g++) {
        cats.add(categories[g]["Name"]);
        if (categories[g]["SubCategories"].toString() != "null") {
          for (int s = 0; s < categories[g]["SubCategories"].length; s++) {
            subcatego[g][(g + 1).toString()].add(
                categories[g]["SubCategories"][s]);
            subcats[g][(g + 1).toString()].add(
                categories[g]["SubCategories"][s]["Name"]);
          }
        }
      }
      return {"1": body["data"], "cat": cats, "subcats": subcats};
    }
    else{
      Get.defaultDialog( title: "no_internet_connection");
    }
  }
  static signup(type, email, password, repassword, name,
      phone, region11, region21, region31, region1back , region2back,region3back ,stroename, id,File photo, fptoken , cat,subcat,accept ,value ) async{
        if (await InternetConnectionChecker().hasConnection) {
          if (region11 != "المحافظة" && region21 != "المدينة" &&
              region31 != "المنطقة") {
            if (accept) {
              for (int f = 0; f < region1back.length; f++) {
                if (region1back[f]["name"].toString() == region11) {
                  region11 = region1back[f]["ID"].toString();
                }
              }
              for (int s = 0; s < region2back.length; s++) {
                if (region2back[s]["name"].toString() == region21) {
                  region21 = region2back[s]["ID"].toString();
                }
              }
              for (int f = 0; f < region3back.length; f++) {
                if (region3back[f]["name"].toString() == region31) {
                  region31 = region3back[f]["ID"].toString();
                }
              }
              var idsubcat;
              bool cooker = false;
              for (int f = 0; f < categories.length; f++) {
                if (categories[f]["Name"].toString() == cat) {
                  cat = categories[f]["ID"].toString();
                  if (subcat.toString() != "null") {
                    for (int s = 0; s <
                        categories[f]["SubCategories"].length; s++) {
                      if (categories[f]["SubCategories"][s]["Name"]
                          .toString() ==
                          subcat.toString()) {
                        idsubcat =
                            categories[f]["SubCategories"][s]["ID"].toString();
                        if (categories[f]["SubCategories"][s]["Type"]
                            .toString() ==
                            "1") {
                          cooker = true;
                        }
                      }
                    }
                  }
                }
              }

                var data = {
                  "email": email.toString(),
                  "password": password.toString(),
                  "password_confirmation": password.toString(),
                  "name": name.toString(),
                  "phone": phone.toString(),
                  "governorate_id": region11.toString(),
                  "city_id": region21.toString(),
                  "region_id": region31.toString(),
                  "type": "0",
                  "fb_token": value.toString(),
                };
                var url = Helper.base_url+"register";
                var response = await http.post(Uri.parse(url), body: data);
                var body = jsonDecode(response.body);
                return body ;
              } else {
              Get.defaultDialog(title: "warning" , content: Text("يجب أن توافق على الشروط والاحكام"));

            }
            }
          else {
            Get.defaultDialog(title: "warning" , content: Text("يجب أن تختار المنطقة بشكل صحيح"));
          }
        }else{
  Get.defaultDialog(title: "warning" , content: Text("no_internet_connection"));
        }

  }
}