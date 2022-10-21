import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Model/home.dart';

class Bottom_nav_controller extends GetxController with GetTickerProviderStateMixin{
  var downloadpro = true ;
  var profiledata = null ;
  TabController tabController ;
  var ind = 0;
  var active = "home";
  var downloadhome = true;
  List ads =[];
  List homedata =[];
  TextEditingController query = TextEditingController();
  var searchable = false;
  var adtime ;
  var iconofshopstate;
  var banner ;
  var downloadfav = true;
  List myorders = [];
  var downloador = true;
  List fav =[];
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    gethomedata();
    super.onInit();
  }
  change_bottom(new_ind , name){
      ind = new_ind;
      active = name;
      tabController.animateTo(ind, duration: Duration(milliseconds: 1));
      update();
      if (active == "favo") {
        getfav();
      }
      if (active == "req") {
        getmyorders();
      }
      if (active == "more") {
        getprofile(true);
      }
    }
    gethomedata()async{
      if (homedata.length >= 1) {
        homedata.clear();
        update();
      }
      if (!downloadhome) {
        downloadhome = true;
        update();
      }
      var dats = await Home_model.gethomedata();
      homedata = dats["categories"];
      List homedatas = [
      ];
      homedatas = homedata;
      adtime = dats["adtime"];
      banner = dats["banner"];
      ads = dats["ad"];
      iconofshopstate = dats["cart"].toString();
      downloadhome = false;
      update();
    }
    getfav() async{
      if (!downloadfav) {
        downloadfav = true;
        update();
      }
      var dats = await Home_model.getfav();
      downloadfav = false;
      if (dats == null) {
        update();
      }
      else {
        fav = dats;
        update();
      }
    }
    getmyorders() async{
      if (!downloador) {
        downloador = true;
        update();
      }
      var dats = await Home_model.getmyorders();
      if (dats.length == 0) {
        myorders = [];
        update();
      }
      else {
        myorders = dats;
      }
      downloador = false;
      update();
    }
    getprofile(update_)async{
      if (profiledata == null || update_) {
        if (!downloadpro) {
          downloadpro = true;
          update();
        }
        var dats = await Home_model.getprofiledata();
        profiledata = dats["profiledata"];
        downloadpro = false;
        update();
      }
    }
  }