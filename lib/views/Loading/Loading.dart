import 'package:ezzproject/Conroller/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Loadingpage extends StatelessWidget{
  final Loading_controller c = Get.put(Loading_controller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}