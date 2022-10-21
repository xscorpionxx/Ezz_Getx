import 'package:ezzproject/views/Main_pages/fav.dart';
import 'package:ezzproject/views/Main_pages/more.dart';
import 'package:ezzproject/views/Main_pages/myorders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../Conroller/Bottom_nav.dart';
import 'Home.dart';

class Bottom_nav extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:  Color.fromRGBO(42, 171, 227, 1),
    ));
    final Bottom_nav_controller controller_ = Get.put(Bottom_nav_controller());
    // TODO: implement build
    return Scaffold(body: Container(width: MediaQuery
        .of(context)
        .size
        .width, height: MediaQuery
        .of(context)
        .size
        .height,
      child: SingleChildScrollView(physics: ClampingScrollPhysics(),
        child: Column(children: [
          // Container(width: 100,height: 100,child: VideoPlayer(_controller)),
          Directionality(textDirection: TextDirection.rtl,
            child: Container(width: MediaQuery
                .of(context)
                .size
                .width, height: MediaQuery
                .of(context)
                .size
                .height * 0.954,
                child: TabBarView(physics: NeverScrollableScrollPhysics(),
                    controller: controller_.tabController,
                    children: [
                      Homescreen1(),
                      favourite(),
                      Myorders(),
                      More(),
                    ])),
          ),
          GetBuilder<Bottom_nav_controller>(
            builder: (controller) =>
                Container(
                  child: Container(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.046,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white),
                    child:
                    Row(children: [
                      Expanded(child: Container(
                          margin: EdgeInsets.only(left: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025, right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.07,
                          child: controller == "more" ? Container(
                            decoration: BoxDecoration(gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green, Colors.blueAccent])),
                            child: FittedBox(
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(top: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.01),
                                    child: SvgPicture.asset("images/Vector.svg",
                                      fit: BoxFit.scaleDown,)),
                                Container(height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.02,
                                    child: FittedBox(child: Text("المزيد",
                                      style: TextStyle(color: Colors.white,
                                          fontSize: MediaQuery
                                              .of(context)
                                              .textScaleFactor * 10),)))
                              ]),
                            ),
                          ) : Container(
                            child: InkWell(onTap: () async {
                              if (controller != "more") {
                                controller.change_bottom(3, "more");
                              }
                            },
                              child: FittedBox(
                                child: Column(children: [
                                  Container(
                                      margin: EdgeInsets.only(top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                      child: SvgPicture.asset(
                                        "images/Vector.svg",
                                        fit: BoxFit.scaleDown,)),
                                  Container(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                      child: FittedBox(child: Text("المزيد",
                                        style: TextStyle(color: Colors.black,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .textScaleFactor * 10),)))
                                ]),
                              ),
                            ),
                          )))
                      , Expanded(child: Container(
                          margin: EdgeInsets.only(left: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025, right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.07,
                          child: controller.active == "req" ? Container(
                            decoration: BoxDecoration(gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green, Colors.blueAccent])),
                            child: Container(
                              child: FittedBox(child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(top: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.01),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.025,
                                    child: Image(
                                      image: AssetImage("images/bar31.png"),
                                      fit: BoxFit.scaleDown,)),
                                Container(height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.02,
                                    child: FittedBox(child: Text("طلباتي",
                                      style: TextStyle(color: Colors.white,
                                          fontSize: MediaQuery
                                              .of(context)
                                              .textScaleFactor * 10),)))
                              ])),
                            ),
                          ) : Container(
                            child: InkWell(onTap: () async {
                              if (controller.active != "req") {
                                controller.change_bottom(2, "req");
                              }
                            },
                              child: Container(
                                child: FittedBox(
                                  child: Column(children: [
                                    Container(
                                        margin: EdgeInsets.only(top: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.01),
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.025,
                                        child: Image(
                                          image: AssetImage("images/bar2.png"),
                                          fit: BoxFit.scaleDown,)),
                                    Container(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02,
                                        child: FittedBox(child: Text("طلباتي",
                                          style: TextStyle(color: Colors.black,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .textScaleFactor * 10),)))
                                  ]),
                                ),
                              ),
                            ),
                          )))
                      , Expanded(child: Container(
                          margin: EdgeInsets.only(left: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025, right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.07,
                          child: controller.active == "favo" ? Container(
                            decoration: BoxDecoration(gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green, Colors.blueAccent])),
                            child: FittedBox(child: Column(children: [
                              Container(margin: EdgeInsets.only(top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.01),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.025,
                                  child: Image(
                                      image: AssetImage("images/bar21.png"),
                                      fit: BoxFit.scaleDown)),
                              Container(height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                                  child: FittedBox(child: Text("مفضلة",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .textScaleFactor * 10),)))
                            ])),
                          ) : Container(
                            child: InkWell(onTap: () async {
                              if (controller.active != "favo") {
                                controller.change_bottom(1, "favo");
                              }
                            },
                              child: FittedBox(
                                child: Column(children: [
                                  Container(
                                      margin: EdgeInsets.only(top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.025,
                                      child: Image(
                                          image: AssetImage("images/bar3.png"),
                                          fit: BoxFit.scaleDown)),
                                  Container(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                      child: FittedBox(child: Text("مفضلة",
                                        style: TextStyle(color: Colors.black,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .textScaleFactor * 10),)))
                                ]),
                              ),
                            ),
                          ))),
                      Expanded(child: Container(
                          margin: EdgeInsets.only(left: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025, right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.025),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.07,
                          child: controller.active == "home" ? Container(
                            decoration: BoxDecoration(gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green, Colors.blueAccent])),
                            child: Container(
                              margin: EdgeInsets.only(top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.01),
                              child: FittedBox(child: Column(children: [
                                Container(height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.025,
                                    child: SvgPicture.asset(
                                      "images/home2azz.svg",
                                      fit: BoxFit.scaleDown,
                                      semanticsLabel: "dacasceqd",))
                                , Container(height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.02,
                                    child: FittedBox(child: Text("الرئيسية",
                                      style: TextStyle(color: Colors.white,
                                          fontSize: MediaQuery
                                              .of(context)
                                              .textScaleFactor * 10),)))
                              ])),
                            ),
                          ) : Container(
                            child: InkWell(onTap: () async {
                              if (controller.active != "home") {
                                controller.change_bottom(0, "home");
                              }
                            },
                              child: Container(
                                margin: EdgeInsets.only(top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.01),
                                child: FittedBox(
                                  child: Column(children: [
                                    Container(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.025,
                                        child: SvgPicture.asset(
                                          "images/home1azz.svg",
                                          fit: BoxFit.scaleDown,
                                          semanticsLabel: "dacadadwsceqd",)),
                                    Container(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02,
                                        child: FittedBox(child: Text("الرئيسية",
                                          style: TextStyle(color: Colors.black,
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .textScaleFactor * 10),)))
                                  ]),
                                ),
                              ),
                            ),
                          ))),
                    ],),),
                ),
          )
        ]),
      ),
    ),);
  }
}