
import 'package:ezzproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../Model/Login.dart';


class Auth1 extends GetMiddleware{
  @override
  int  get Priority => 1 ;
  @override
  RouteSettings redirect(String route) {
    var phone =   sharedPreferences.getString("phone");
    var token = sharedPreferences.getString("token");
    var pass = sharedPreferences.getString("password");
    var logintype = sharedPreferences.getString("logintype");
    if(token == null || phone ==null) return RouteSettings(name: "login");

  }

}