import 'package:ezzproject/Conroller/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Loginpage extends StatelessWidget{
  final Login_controller c = Get.put(Login_controller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
      child:  SingleChildScrollView(
        child: Container(color: Colors.greenAccent.withOpacity(0.4),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Positioned(top: -MediaQuery.of(context).size.height*0.1,left: MediaQuery.of(context).size.width*0.4,child: Container(height: MediaQuery.of(context).size.width*0.8,width: MediaQuery.of(context).size.width*0.8 ,child: SizedBox(),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blueAccent.withOpacity(0.4)))),
            Positioned(top: MediaQuery.of(context).size.height*0.1,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(200),topLeft: Radius.circular(200)),color: Colors.white.withOpacity(0.8)),height: MediaQuery.of(context).size.height*0.9,width: MediaQuery.of(context).size.width,
              child:  GetBuilder<Login_controller>(builder: (controller)=>
                 Form(key: controller.key ,
                  child:  SingleChildScrollView(
                    child: Column(children: [
                      Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.07),width: MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height*0.15 ,child: Image(image: AssetImage("images/logoaz.png"),),)
                      ,         Container(margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02) ,child: Text("تسجيل دخول",style: TextStyle(fontSize:17,color: Color.fromRGBO(42, 171, 227, 1)),),)
                      , Container(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.015),margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05)  ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue.shade50),child: Row(children:[Expanded(child: FittedBox(
                        child: Container(height: MediaQuery.of(context).size.height*0.07,decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )) ,child: Row(children: [
                          Container(margin: EdgeInsets.only(left: 10),width:MediaQuery.of(context).size.width*0.08,height: MediaQuery.of(context).size.height*0.035,child: Image(fit: BoxFit.fill,image: AssetImage("images/flagicon.jpg"),),),
                          Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),child: Text("+966",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.015),),)
                        ]),),
                      )) ,Expanded(flex: 3,child: Directionality(textDirection: TextDirection.rtl,child: TextFormField(controller: controller.phone,validator: controller.validateMobile,style: TextStyle(fontSize: 15,color: Color.fromRGBO(139, 139, 139, 1)),autofocus: false, keyboardType: TextInputType.phone,inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],decoration: InputDecoration(border: InputBorder.none,hintText: "رقم الهاتف",hintStyle:  TextStyle(fontSize: 15,color: Color.fromRGBO(139, 139, 139, 1)),),)))]),)
                      , Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.015),margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05)  ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue.shade50),child:
                      Directionality(textDirection: TextDirection.rtl,child: TextFormField( controller: controller.password ,validator: controller.validate
                        ,style: TextStyle(fontSize: 15,color: Color.fromRGBO(139, 139, 139, 1)),decoration: InputDecoration(border: InputBorder.none,hintText: "كلمة السر",hintStyle:  TextStyle(fontSize: 15,color: Color.fromRGBO(139, 139, 139, 1))),))),
                      InkWell(onTap: ()=>controller.login(),
                        child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025),decoration: BoxDecoration(boxShadow: [  BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0), // shadow direction: bottom right
                        )],color: Color.fromRGBO(69, 190, 0, 1)),height: MediaQuery.of(context).size.height*0.07,width: MediaQuery.of(context).size.width*0.85,child: Center(child: Text("دخول",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.02),),),),
                      ),
                      Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only(top: 80),alignment: Alignment.center,child: Text("أو يمكنك الدخول",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.016),),))
                      ,  Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),child: Row(children:[ Expanded(child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05,top: MediaQuery.of(context).size.height*0.01),alignment: Alignment.centerLeft,child: Text("أليس لديك حساب ؟",style: TextStyle(fontSize: 12,color: Color.fromRGBO(139, 139, 139, 1)),),)),Expanded(child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05,top: MediaQuery.of(context).size.height*0.01),alignment: Alignment.centerRight,child: InkWell(onTap: (){Get.toNamed("signup");},child :Text("  اشتراك جديد",style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold),)),))]))),
                    ],),
                  ),
                ),
              ),
            )),
          ],
          ),
        ),
      ),),);
  }
}