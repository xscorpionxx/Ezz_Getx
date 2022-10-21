import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Conroller/Bottom_nav.dart';
Widget Myorders(){

  return
    Directionality(textDirection: TextDirection.ltr, child:
    Container(
      child: ListView(children: [
        Container(width: Get
            .size
            .width, height: Get
            .size
            .height * 0.12, child:
        Container(width: Get
            .size
            .width,
          height: Get
              .size
              .height * 0.12,
          decoration: BoxDecoration(
              color: Color.fromRGBO(42, 171, 227, 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          child: Row(children: [
            Expanded(flex: 5, child: Container(
                alignment: Alignment.center,
                child: Text("طلباتي", style: TextStyle(
                    color: Colors.white, fontSize: Get
                    .size
                    .height * 0.02),))),
          ],),)),
        Container(
          child: Row(
            children:[Expanded(child: Container(alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20,top: 15),
              child: InkWell(onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder:(context){
                //   return Eventorder();
                // }));
              },
                child: Text("طلبات الطهاة", style: TextStyle(fontSize: Get
                    .textScaleFactor * 12, color: Colors.red, fontWeight: FontWeight.bold),),
              ),)),Expanded(child: Container(alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right:Get
                  .size
                  .width * 0.1, top: 15),
              child: Text("جميع الطلبات", style: TextStyle(fontSize: Get
                  .textScaleFactor * 12, fontWeight: FontWeight.bold),),)),],
          ),
        )
        , Directionality(textDirection: TextDirection.rtl,
          child: GetBuilder<Bottom_nav_controller>(
            builder:(controller) => Container(
              child:  controller.downloador
                  ?Container(height: Get
                  .size
                  .height * 0.7,child: Center(child: CircularProgressIndicator(),),) : controller.myorders.length == 0 ?Container(height:
             Get.size
                  .height * 0.7,
                child: Center(child: Text("لا توجد طلبات مسبقة")),)
                  :  Container(
                height: Get
                    .size
                    .height * 0.75,
                margin: EdgeInsets.only(top: Get
                    .size
                    .height * 0.01),
                child: ListView.builder(physics: BouncingScrollPhysics(),
                    itemCount: controller.myorders.length, itemBuilder: (context, i) {
                      return Container(decoration: BoxDecoration(
                          color: Colors.white, boxShadow: [ BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                            22.0, 2.0), // shadow direction: bottom right
                      )
                      ]), margin: EdgeInsets.only(top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01, bottom: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01),
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.only(top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.02, bottom: MediaQuery
                                .of(context)
                                .size
                                .height * 0.02),
                              child: Row(children: [
                                Expanded(flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01),
                                    child: Column(children: [
                                      Container(child: Row(children: [
                                        Expanded(child: Container(
                                          margin: EdgeInsets.only(
                                              right: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.01),
                                          padding: EdgeInsets.only(
                                              right: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.02, left: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.02),
                                          child: FittedBox(child: AutoSizeText(
                                            "رقم الطلب :", maxFontSize: MediaQuery
                                              .of(context)
                                              .textScaleFactor * 10,
                                            minFontSize: MediaQuery
                                                .of(context)
                                                .textScaleFactor * 10,
                                            style: TextStyle(fontSize: MediaQuery
                                                .of(context)
                                                .textScaleFactor * 10),)),)),
                                        Expanded(child: Container(
                                            alignment: Alignment.centerRight,
                                            child: FittedBox(child: AutoSizeText(
                                              controller.myorders[i]["OrderCode"].toString(),
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                      .of(context)
                                                      .textScaleFactor * 10,
                                                  color: Color.fromRGBO(
                                                      41, 45, 43, 1)),))))
                                      ])),
                                      Container(alignment: Alignment.centerLeft,
                                          child: Row(children: [
                                            Expanded(child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.01),
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02,
                                                  left: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02),
                                              child: FittedBox(
                                                  child: AutoSizeText(
                                                    "نوع الخدمة :",
                                                    maxFontSize: MediaQuery
                                                        .of(context)
                                                        .textScaleFactor * 10,
                                                    minFontSize: MediaQuery
                                                        .of(context)
                                                        .textScaleFactor * 10,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .textScaleFactor *
                                                            10),)),)),
                                            Expanded(child: Container(
                                                alignment: Alignment.centerRight,
                                                child: Directionality(
                                                    textDirection: TextDirection
                                                        .ltr,
                                                    child: FittedBox(
                                                        child: AutoSizeText(
                                                          controller.myorders[i]["Type"],
                                                          style: TextStyle(
                                                              fontSize: MediaQuery
                                                                  .of(context)
                                                                  .textScaleFactor *
                                                                  10),)))))
                                          ])),
                                      Container(
                                        child: controller.myorders[i]["Amount"] == null
                                            ? Container()
                                            : Container(
                                            alignment: Alignment.centerLeft,
                                            child: Row(children: [
                                              Expanded(child: Container(
                                                margin: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.01),
                                                padding: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.02,
                                                    left: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.02),
                                                child: FittedBox(
                                                    child: AutoSizeText(
                                                      "قيمة الطلب :",
                                                      maxFontSize: MediaQuery
                                                          .of(context)
                                                          .textScaleFactor * 10,
                                                      minFontSize: MediaQuery
                                                          .of(context)
                                                          .textScaleFactor * 10,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery
                                                              .of(context)
                                                              .textScaleFactor *
                                                              10),)),)),
                                              Expanded(child: Container(
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: Directionality(
                                                      textDirection: TextDirection
                                                          .ltr,
                                                      child: FittedBox(
                                                          child: AutoSizeText(
                                                            controller.myorders[i]["Amount"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: MediaQuery
                                                                    .of(context)
                                                                    .textScaleFactor *
                                                                    10),)))))
                                            ])),
                                      )
                                    ]),),),
                                Expanded(flex: 1,
                                    child: Container(
                                        padding: EdgeInsets.all(MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.01),
                                        margin: EdgeInsets.all(MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.01),
                                        child: Column(children: [
                                          Container(child: Row(children: [
                                            Expanded(child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0),
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02,
                                                  left: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02),
                                              child: Directionality(
                                                  textDirection: TextDirection
                                                      .rtl,
                                                  child: FittedBox(
                                                      child: AutoSizeText(
                                                        "تاريخ الطلب :",
                                                        maxFontSize: MediaQuery
                                                            .of(context)
                                                            .textScaleFactor * 10,
                                                        minFontSize: MediaQuery
                                                            .of(context)
                                                            .textScaleFactor * 10,
                                                        style: TextStyle(
                                                            fontSize: MediaQuery
                                                                .of(context)
                                                                .textScaleFactor *
                                                                10),))),)),
                                            Expanded(child: Container(
                                                margin: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0),
                                                alignment: Alignment.centerRight,
                                                child: Directionality(
                                                    textDirection: TextDirection
                                                        .ltr,
                                                    child: FittedBox(
                                                        child: AutoSizeText(
                                                          controller.myorders[i]["OrderDate"],
                                                          style: TextStyle(
                                                              fontSize: MediaQuery
                                                                  .of(context)
                                                                  .textScaleFactor *
                                                                  10),))))),
                                          ])),
                                          Container(child: Row(children: [
                                            Expanded(child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0),
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02,
                                                  left: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02),
                                              child: Directionality(
                                                  textDirection: TextDirection
                                                      .rtl,
                                                  child: FittedBox(
                                                      child: AutoSizeText(
                                                        "اسم التاجر : ",
                                                        maxFontSize: MediaQuery
                                                            .of(context)
                                                            .textScaleFactor * 10,
                                                        minFontSize: MediaQuery
                                                            .of(context)
                                                            .textScaleFactor * 10,
                                                        style: TextStyle(
                                                            fontSize: MediaQuery
                                                                .of(context)
                                                                .textScaleFactor *
                                                                10),))),)),
                                            Expanded(child: Container(
                                                margin: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0),
                                                alignment: Alignment.centerRight,
                                                child: Directionality(
                                                    textDirection: TextDirection
                                                        .ltr,
                                                    child: FittedBox(
                                                        child: AutoSizeText(
                                                          controller.myorders[i]["StoreName"],
                                                          style: TextStyle(
                                                              fontSize: MediaQuery
                                                                  .of(context)
                                                                  .textScaleFactor *
                                                                  10),))))),
                                          ])),
                                          Container(
                                            child: Row(children: [
                                              Expanded(child: Container(
                                                margin: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0),
                                                padding: EdgeInsets.only(
                                                    right: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.02,
                                                    left: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.02),
                                                child: AutoSizeText("الحالة :",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery
                                                          .of(context)
                                                          .textScaleFactor *
                                                          13),),)),
                                              Expanded(child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width * 0),
                                                  alignment: Alignment.centerRight,
                                                  padding: EdgeInsets.all(MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.01),
                                                  child: FittedBox(
                                                      child: AutoSizeText(
                                                        controller.myorders[i]["OrderStatus"],
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(
                                                                244, 121, 27, 1),
                                                            fontSize: MediaQuery
                                                                .of(context)
                                                                .textScaleFactor *
                                                                10),))))
                                            ]),
                                          ),
                                        ],)))
                              ]),
                            ),
                            Container(margin: EdgeInsets.only(bottom: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01), child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                InkWell(
                                    child: Container(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.25,
                                      margin: EdgeInsets.only(left: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.01, right: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.01),
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.04,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(12, 145, 190, 1),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(child: FittedBox(child: Row(
                                          children: [
                                            Icon(Icons.info, color: Colors.white,
                                              size: 18,),
                                            Container(
                                                padding: EdgeInsets.all(MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.02),
                                                child: AutoSizeText("التفاصيل",
                                                    style: TextStyle(
                                                        fontSize: 13, color: Colors
                                                        .white))),
                                          ]))),))
                                ,
                                Container(child: controller.myorders[i]["OrderKeyStatus"].toString() ==
                                    "0" ? InkWell(child: Container(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.25,
                                      margin: EdgeInsets.only(left: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.01, right: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.01),
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.04,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(246, 7, 7, 1),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: FittedBox(child: Row(children: [
                                        Icon(Icons.delete, color: Colors.white,
                                          size: 18,),
                                        Container(padding: EdgeInsets.all(MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.02),
                                            child: AutoSizeText("الغاء الطلب",
                                              style: TextStyle(
                                                  fontSize: 13, color: Colors
                                                  .white),)),
                                      ])),))
                                    : controller.myorders[i]["Reviews"].length ==0 ? InkWell( child: Container(width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.25,
                                  margin: EdgeInsets.only(left: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.01, right: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.01),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withGreen(200),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: FittedBox(child: Row(children: [
                                    Icon(Icons.rate_review, color: Colors.white,
                                      size: 18,),
                                    Container(padding: EdgeInsets.all(MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02),
                                        child: AutoSizeText("قيم الطلب",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors
                                              .white),)),
                                  ])),)) :InkWell( child: Container(width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.25,
                                  margin: EdgeInsets.only(left: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.01, right: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.01),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withGreen(200),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: FittedBox(child: Row(children: [
                                    Icon(Icons.rate_review, color: Colors.white,
                                      size: 18,),
                                    Container(padding: EdgeInsets.all(MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.02),
                                        child: AutoSizeText("رؤية التقييم",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors
                                              .white),)),
                                  ])),)) ),Container(
                                  child:controller.myorders[i]["OrderKeyStatus"].toString()=="3" ||controller.myorders[i]["OrderKeyStatus"].toString()=="4"
                                      ||controller.myorders[i]["OrderKeyStatus"].toString()=="5" ?Container(): controller.myorders[i]["Type"] !="اماكن"? InkWell(
                                      child: Container(width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.25,
                                        margin: EdgeInsets.only(left: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.01, right: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.01),
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.04,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(12, 145, 190, 1),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Center(child: FittedBox(child: Row(
                                            children: [
                                              Icon(Icons.info, color: Colors.white,
                                                size: 18,),
                                              Container(
                                                  padding: EdgeInsets.all(MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.02),
                                                  child: AutoSizeText(controller.myorders[i]["DeliveryStatus"].toString()=="1"?"رؤية العروض" :
                                                  controller.myorders[i]["DeliveryStatus"].toString()=="2"?"تم اختيار مرسول" : "طلب مرسول",
                                                      style: TextStyle(
                                                          fontSize: 13, color: Colors
                                                          .white))),
                                            ]))),)):Container(),
                                ),
                                Container(
                                  child:controller.myorders[i]["OrderKeyStatus"].toString()=="1"? InkWell( child: Container(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.25,
                                    margin: EdgeInsets.only(left: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01, right: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(12, 145, 190, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(child: FittedBox(child: Row(
                                        children: [
                                          Icon(Icons.info, color: Colors.white,
                                            size: 18,),
                                          Container(
                                              padding: EdgeInsets.all(MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.02),
                                              child: AutoSizeText("محادثة",style: TextStyle(color: Colors.white,fontSize: 14),)),
                                        ]))),)):Container(),
                                )
                              ]),
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        )
      ],),
    ));
}
