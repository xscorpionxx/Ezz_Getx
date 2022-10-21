import 'package:auto_size_text/auto_size_text.dart';
import 'package:ezzproject/Conroller/Bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


Widget More(){
  return Directionality(textDirection: TextDirection.rtl,
    child: GetBuilder<Bottom_nav_controller>(builder: (controller)=>
      Container(child:controller.downloadpro? Container(child: Center(child: CircularProgressIndicator(),),): SingleChildScrollView(
        child: Column(children: [
          Directionality(textDirection: TextDirection.ltr,
            child: Container(margin: EdgeInsets.only(top: 70, right: 15),
              alignment: Alignment.center,
              child: Row(children: [

                Expanded(flex: 4,
                  child: Container(margin: EdgeInsets.only(right: Get
                      .size
                      .width * 0.05), child: Column(children: [
                    Container(margin: EdgeInsets.only(left: Get
                        .size
                        .width * 0.07),
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(controller.profiledata.toString() == "null"
                          ? ""
                          : controller.profiledata["Name"].toString(), maxLines: 1,
                        style: TextStyle(color: Color.fromRGBO(11, 12, 58, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),),),
                    Container(alignment: Alignment.centerRight,
                      child: AutoSizeText(controller.profiledata.toString() == "null"
                          ? ""
                          : controller.profiledata["Email"].toString(), maxLines: 1,
                        style: TextStyle(fontSize: 14),),)
                  ],)),
                )
                ,
                Expanded(flex: 2,
                    child: Container(decoration: BoxDecoration(border: Border
                        .all(color: Color.fromRGBO(86, 86, 86, 1).withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10)),
                      width: Get
                          .size
                          .width * 0.2,
                      height: Get
                          .size
                          .width * 0.2,
                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: controller.profiledata == null ? Container() : Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                controller.profiledata["ProfilePhoto"]),)),)),
              ],),),
          ),
          Container(margin: EdgeInsets.only(top: Get
              .size
              .height * 0.02),child:
          InkWell(onTap: () => null ,//navigatetolocation(context),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    title: Text("الموقع", style: TextStyle(fontSize: Get
                        .textScaleFactor * 13),),
                    leading: Container(width: Get
                        .size
                        .width * 0.11,
                      height: Get
                          .size
                          .width * 0.11,
                      child: Image(fit: BoxFit.fill,
                          image: AssetImage("images/more1.png")),)),)))
          ,

          InkWell(onTap: () => null ,//navigatetoprofile(context,logintype),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                margin: EdgeInsets.zero,
                child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    title: Text(
                      "الملف الشخصي", style: TextStyle(fontSize: Get
                        .textScaleFactor * 13),),
                    leading: Container(width: Get
                        .size
                        .width * 0.11,
                      height: Get
                          .size
                          .width * 0.11,
                      child: SvgPicture.asset(
                        "images/editprofile.svg", fit: BoxFit.fill,),)),)
          ),
          InkWell(onTap: () => null ,//navigatetopchat(context),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text("محادثة", style: TextStyle(fontSize: Get
                      .textScaleFactor * 13),),
                  leading: Container(width: Get
                      .size
                      .width * 0.11,
                      height: Get
                          .size
                          .width * 0.11,
                      child: SvgPicture.asset(
                        "images/chat.svg", fit: BoxFit.fill,)),),)
          ),
          InkWell(onTap: () => null , //navigatetoppartner(context,profiledata),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    title: Text(
                      "شركاء النجاح", style: TextStyle(fontSize: Get
                        .textScaleFactor * 13),),
                    leading: Container(width: Get
                        .size
                        .width * 0.11,
                      height: Get
                          .size
                          .width * 0.11,
                      child: Image(fit: BoxFit.fill,
                          image: AssetImage("images/more4.png")),),))),
          InkWell(onTap: () => null ,//homelogic.shareapp(),
            child: Container(height: Get
                .size
                .height * 0.06,
              child: ListTile(trailing: Icon(Icons.arrow_forward_ios_outlined),
                title: Text(
                  "شارك التطبيق", style: TextStyle(fontSize:Get
                    .textScaleFactor * 13),),
                leading: Container(width: Get
                    .size
                    .width * 0.11,
                    height: Get
                        .size
                        .width * 0.11,
                    child: Image(image:AssetImage("images/shareaz.png") ,fit: BoxFit.fill,)),),),
          ),
          InkWell(onTap: () =>null , //navigatetopcomplaints(context),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    "الاقتراحات والشكاوى", style: TextStyle(fontSize: Get
                      .textScaleFactor * 13),),
                  leading: Container(width: Get
                      .size
                      .width * 0.11,
                    height: Get
                        .size
                        .width * 0.11,
                    child: Image(fit: BoxFit.fill,
                        image: AssetImage("images/more6.png")),),),)),
          InkWell(onTap: () => null , //navigatetopaboutapp(context),
            child: Container(height: Get
                .size
                .height * 0.06,
              child: ListTile(trailing: Icon(Icons.arrow_forward_ios_outlined),
                title: Text("عن التطبيق", style: TextStyle(fontSize: Get
                    .textScaleFactor * 13),),
                leading: Container(width: Get
                    .size
                    .width * 0.11,
                  height: Get
                      .size
                      .width * 0.11,
                  child: Image(fit: BoxFit.fill,
                      image: AssetImage("images/more7.png")),),),),
          ),
          InkWell(onTap: () => null ,//navigatetoterms(context),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    "الشروط والأحكام", style: TextStyle(fontSize: Get
                      .textScaleFactor * 13),),
                  leading: Container(width: Get
                      .size
                      .width * 0.11,
                    height: Get
                        .size
                        .width * 0.11,
                    child: Image(fit: BoxFit.fill,
                        image: AssetImage("images/more8.png")),),),)),
          InkWell(onTap: () => null ,//navigatetopolicy(context),
              child: Container(height: Get
                  .size
                  .height * 0.06,
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    "سياسة الاستخدام", style: TextStyle(fontSize: Get
                      .textScaleFactor * 13),),
                  leading: Container(width: Get
                      .size
                      .width * 0.11,
                    height: Get
                        .size
                        .width * 0.11,
                    child: Image(fit: BoxFit.fill,
                        image: AssetImage("images/more8.png")),),),))
          ,
          InkWell(onTap: () => null ,//signout(context)
              child: Container(height: Get
              .size
              .height * 0.06,margin: EdgeInsets.only(bottom: 30),
            child: ListTile(trailing: Icon(Icons.arrow_forward_ios_outlined),
              title: Text("تسجيل الخروج", style: TextStyle(fontSize: Get
                  .textScaleFactor * 13),),
              leading: Container(width: Get
                  .size
                  .width * 0.11,
                  height: Get
                      .size
                      .width * 0.11,
                  decoration: BoxDecoration(gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green, Colors.blueAccent])),
                  child: Icon(Icons.logout, color: Colors.white,)),),)
          )
        ],),
      )),
    ),
  );

}
