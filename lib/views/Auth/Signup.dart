import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Conroller/Signup.dart';

class Signuppage extends StatelessWidget {
  final Signup_controller c = Get.put(Signup_controller());
  @override
  Widget build(BuildContext context) {
    var boxdeco =  BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(
      color: Colors.black38,
      blurRadius: 1.0,
      spreadRadius: 0.0,
      offset: Offset(0.5, 0.5), // shadow direction: bottom right
    )]);
    // TODO: implement build
    return Scaffold(resizeToAvoidBottomInset:true, body: Form(key: c.key,
      child: SingleChildScrollView(
        child: Container(color: Colors.greenAccent.withOpacity(0.5),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
          child:  Stack(children: [
            Positioned(top: -MediaQuery.of(context).size.height*0.1,left: MediaQuery.of(context).size.width*0.4,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(300),color: Colors.blueAccent.withOpacity(0.4)),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.width,)),
            Positioned(top: MediaQuery.of(context).size.height*0.03,child: Container(child: IconButton(onPressed:(){
              Navigator.of(context).maybePop();
            },icon: Icon(Icons.arrow_back_ios,size: 25,),),))
            ,Positioned(top: MediaQuery.of(context).size.height*0.05,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(200),topLeft: Radius.circular(200)),color: Colors.white.withOpacity(0.95)),height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.width,
                child:  Column(children: [
                  Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),width: MediaQuery.of(context).size.width*0.15,height:MediaQuery.of(context).size.height*0.1 ,child: Image(image: AssetImage("images/logoaz.png"),),),
                  Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),child: Text("اشتراك جديد",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),),)
                ],)
            )),
            Positioned(top: MediaQuery.of(context).size.height*0.3,child: Container(decoration: BoxDecoration( boxShadow: [ BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(0.5, 0.5), // shadow direction: bottom right
            )],borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),height: MediaQuery.of(context).size.height*0.7,width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: GetBuilder<Signup_controller>(init: Signup_controller(),
                    builder:(controler)=> Column(children: [
                      Directionality(textDirection: TextDirection.rtl, child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                        decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child: TextFormField(controller: controler.name,validator: controler.validatename ,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017),decoration: InputDecoration(hintText: "الاسم بالكامل",border: InputBorder.none),),)),
                      Directionality(textDirection: TextDirection.rtl, child:Container()
                      ),
                      Directionality(textDirection: TextDirection.rtl, child:Container() ),
                      Directionality(textDirection: TextDirection.ltr, child: Container(height: MediaQuery.of(context).size.height*0.08,
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                        decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,
                        child: Row(
                          children:[Expanded(child:Container(height: MediaQuery.of(context).size.height*0.08, decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )) ,
                            child: FittedBox(child: Container(child:
                            Row(children: [
                              Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01) ,width:MediaQuery.of(context).size.width*0.08,height: MediaQuery.of(context).size.height*0.03,child: Image(fit: BoxFit.fill,image: AssetImage("images/flagicon.jpg"),),),
                              Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),child: Text("+966",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.03),),)
                            ]),)),
                          )) ,Expanded(flex: 3,
                            child: Directionality(textDirection: TextDirection.rtl,
                              child: Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child: TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017),keyboardType: TextInputType.phone,controller: controler.phone,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],validator: controler.validateMobile,decoration: InputDecoration(hintText: "رقم الجوال",border: InputBorder.none),),),
                            ),
                          )],
                        ),
                      ))
                      ,Directionality(textDirection: TextDirection.rtl, child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                        decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child: TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017),keyboardType: TextInputType.emailAddress , controller: controler.email,validator: controler.validateemail ,decoration: InputDecoration(hintText: "البريد الالكتروني",border: InputBorder.none),),)),
                      Directionality(textDirection: TextDirection.rtl, child: InkWell(
                        child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                            decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,height: MediaQuery.of(context).size.height*0.08,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child:
                            ListTile(
                              title: Directionality(textDirection: TextDirection.rtl,
                                child: DropdownButtonHideUnderline(
                                    child: Directionality(textDirection: TextDirection.rtl,
                                      child: DropdownButton(
                                        value: controler.region1
                                        ,items: controler.region1list.map((e) =>  DropdownMenuItem(child: Directionality(textDirection: TextDirection.rtl,child: Container(alignment: Alignment.centerRight,child:
                                      Text('$e',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,color:e==controler.region1?Color.fromRGBO(69, 190, 0, 1) :Colors.black38),))),value: e,)).toList(),
                                        onChanged: (_) {
                                          if(_.toString() != "المنطقة") {
                                            controler.region1 = _;
                                            controler.slecetcity(controler.region1);
                                            controler.update();
                                          }
                                        },
                                      ),
                                    )),
                              ),
                            )),
                      )),
                      Directionality(textDirection: TextDirection.rtl, child: InkWell(
                        child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                          decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,height: MediaQuery.of(context).size.height*0.08,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child:
                          ListTile(
                            title: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: controler.region2
                                  ,items: controler.region2list.map((e) => DropdownMenuItem(child: Container(alignment: Alignment.centerRight,child:
                                Text('$e',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,color:e==controler.region2?Color.fromRGBO(69, 190, 0, 1) :Colors.black38),)),value: e,)).toList(),
                                  onChanged: (_) {
                                    if(_.toString() != "المحافظة") {
                                      controler.region2 = _;
                                      controler.selectgovern(controler.region2);
                                      controler.update();
                                    }
                                  },
                                )),
                          ),),
                      )),
                      Directionality(textDirection: TextDirection.rtl, child: InkWell(
                        child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                            decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,height: MediaQuery.of(context).size.height*0.08,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child:
                            ListTile(
                              title: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: controler.region3
                                    ,items: controler.region3list.map((e) => DropdownMenuItem(child: Container(alignment: Alignment.centerRight,child:
                                  Text('$e',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,color:e==controler.region3?Color.fromRGBO(69, 190, 0, 1) :Colors.black38),)),value: e,)).toList(),
                                    onChanged: (_) {
                                      if(_.toString() != "المدينة") {
                                        controler.region3 = _;
                                        controler.update();
                                      }
                                    },
                                  )),
                            )),
                      )),
                     Directionality(textDirection: TextDirection.rtl, child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                        decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child: TextFormField(obscureText: true,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017),controller: controler.password,validator: controler.validatepassword ,decoration: InputDecoration(hintText: "كلمة السر",border: InputBorder.none),),))
                      ,Directionality(textDirection: TextDirection.rtl, child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                        decoration: boxdeco,width: MediaQuery.of(context).size.width*0.9,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),child: TextFormField(obscureText: true,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017),controller: controler.repassword,validator: controler.validatepasswordre ,decoration: InputDecoration(hintText: "تأكيد كلمة السر",border: InputBorder.none)),)),
                      Directionality(textDirection: TextDirection.ltr,
                        child: Container(margin: EdgeInsets.only(top: 5 ,right:10),child: CheckboxListTile(activeColor: Colors.green ,value: controler.value,onChanged: (val){
                          controler.value = val;
                        controler.update();},title://Transform.translate(
                        //offset: const Offset(100, 0),
                        //child:
                        Directionality(textDirection: TextDirection.rtl,
                          child: Container(alignment: Alignment.centerRight ,child:Row(children:[ Text("أوافق على",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,),),
                            InkWell( onTap: (){
                              //controler.viewrules();
                            },child: Text(" الشروط والأحكام" , style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,color: Colors.red,decoration: TextDecoration.underline),)),])),
                        ),
                          //) ),
                        )),
                      ),
                      InkWell(onTap: ()=> controler.signup(),
                        child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02,top: 10),decoration: BoxDecoration(color: Color.fromRGBO(69, 190, 0, 1)),height: MediaQuery.of(context).size.height*0.07,width: MediaQuery.of(context).size.width*0.9,child: Center(child: Text("اشتراك",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.025),),),),
                      ),
                      Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1,),child: Row(children:[ Expanded(flex: 4,child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05,top: MediaQuery.of(context).size.height*0.01),alignment: Alignment.centerLeft,child: Text("لديك حساب بالفعل؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),),)),Expanded(flex: 3,child: InkWell(child: Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05,top: MediaQuery.of(context).size.height*0.01),alignment: Alignment.centerRight,child: InkWell(onTap: ()=>null,child: Text("سجل الدخول",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: MediaQuery.of(context).size.height*0.02),)),)))]))),
                    ],
                    ),
                  ),
                )
            ))
          ],
          ),),
      ),
    ),);
  }
}