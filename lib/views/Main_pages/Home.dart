
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Conroller/Bottom_nav.dart';

var ind = 0;
List databannerimages = [];

Widget Homescreen1() {
  return Directionality(textDirection: TextDirection.ltr,
    child: Container(child: ListView(children: [
      Container(
        child: Container(
          width: Get.size.width, height: Get.size.height * 0.11,
          decoration: BoxDecoration(color: Color.fromRGBO(42, 171, 227, 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))), child:
        Container(child:
        GetBuilder<Bottom_nav_controller>(
          builder:(controller)=> Container(
            child: Column(children: [
              Container(
                child:controller.searchable?Container(): Container(margin: EdgeInsets.only(top: Get.size.height*0.03,bottom: Get.size.height*0.0),
                  child: Row(children: [
                    Expanded(flex: 4,child:InkWell(onTap: (){//Provider.of<Notifires>(context,listen: false).setsearch();
                    },child: Container( alignment: Alignment.center,margin: EdgeInsets.only(left: Get.textScaleFactor*20),child: Icon(Icons.search,color: Colors.white,size: Get.size.width*0.06,))) ),
                    Expanded(flex: 20,child: Container(alignment: Alignment.center,margin: EdgeInsets.only(left: Get.size.width*0.1),height: Get.size.height*0.05,width: Get.size.width*0.05,child:Image(image: AssetImage("images/logoaz.png"),fit: BoxFit.fill,)
                    )),
                    Expanded(flex:4 ,child: InkWell(onTap: ()=>null,child: SvgPicture.asset("images/Icon-alarm.svg",semanticsLabel: "wadca",))),
                    Expanded(flex: 3,child:InkWell(onTap: ()=>null,child:
                    Container(child:SvgPicture.asset("images/Icon feather-shopping-cart.svg",semanticsLabel: "wasdca", ))) ),
                    Expanded(flex:3 ,child: InkWell(onTap: ()=>null,child: Icon(Icons.settings,color: Colors.white,))),
                  ],),
                ),
              ),
              //   Container(
              //   child:!controller.searchable?Container(): Container(padding: EdgeInsets.only(right:  Get.size.width*0.01 ,left: Get.size.width*0.01) ,margin: EdgeInsets.only(top: Get.size.height*0.02,left: Get.size.width*0.15,right:Get.size.width*0.15 ),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5))
              //     ,child: Directionality(textDirection: TextDirection.rtl,child: TextFormField(controller: controller.query,onChanged: (val){
              //       //Provider.of<Notifires>(context ,listen: false).search(homedata, val);
              //     }, style:  TextStyle(fontSize: Get.textScaleFactor*12,color: Colors.black26),decoration: InputDecoration(hintText: "بحث",hintStyle: TextStyle(fontSize: Get.size.width*0.035,color: Colors.black26),border: InputBorder.none,suffixIcon: InkWell( onTap: (){
              //       controller.query.text = "";
              //       //Provider.of<Notifires>(context,listen: false).setsearch();
              //     },child: Icon(Icons.close,color: Colors.black26,))),)),),
              // )
            ]),
          ),
        )),
        ),
      ),
      GetBuilder<Bottom_nav_controller>(
        builder: (controller) =>
            Container(
              child: Container(margin: EdgeInsets.all(Get.size.width * 0.03),
                height: Get.size.height * 0.15,
                child: controller.ads.length == 0 ? Container() :
                CarouselSlider.builder(options: CarouselOptions(
                    height: Get.size.height * 0.43, viewportFraction: 1,
                    onPageChanged: (indq, reason) {
                      // setState(() {
                      //   ind = indq;
                      // });
                    }
                    , autoPlay: true),
                  itemBuilder: (context, index, real) {
                    return Container(width: MediaQuery
                        .of(context)
                        .size
                        .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child:
                        FadeInImage(fit: BoxFit.fill,
                          image: NetworkImage(controller.ads[ind]["Photo"])
                          ,
                          placeholder: AssetImage("images/logoaz.png"),));
                  }, itemCount: controller.ads.length,)
                ,),
            ),
      ),
      Container(margin: EdgeInsets.only(right: Get.size.width * 0.05),
        alignment: Alignment.centerRight,
        child: Text("خدماتنا", style: TextStyle(
            color: Color.fromRGBO(8, 67, 143, 1),
            fontWeight: FontWeight.bold,
            fontSize: Get.textScaleFactor * 14)),)
      , GetBuilder<Bottom_nav_controller>(
          builder: (controller) =>
              Container(
                child: controller.downloadhome
                    ? Container(height: Get.size.height * 0.61,
                  child: Center(child: CircularProgressIndicator(),),)
                    : controller.homedata.length == 0 ? Container(
                  height: Get.size.height * 0.61,
                  child: Center(child: Text("لا يوجد خدمات حاليا"),),) :
                Container(height: Get.size.height * 0.61,
                    width: Get.size.width,
                    child: controller.homedata.length == 0 ? Container(
                      child: Center(
                          child: Text("لا يوجد خدمات حاليا", style: TextStyle(
                              fontSize: Get.textScaleFactor * 14),)),
                    ) : controller.query.text == "" || !controller.searchable
                        ? GridView.builder(physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (Get.size.width * 1.5 /
                              Get.size.height * 1.62),),
                        itemCount: controller.homedata.length,
                        itemBuilder: (context, i) {
                          return Container(margin: EdgeInsets.all(MediaQuery
                              .of(context)
                              .size
                              .width * 0.03),
                            child: InkWell(onTap: () => null,
                              //showtoshowpage(i,controller.homedata[i]["Name"] , controller.homedata[i]["SubCategories"],false),
                              child: Container(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12.withOpacity(0.2),
                                      blurRadius: 1.0,
                                      spreadRadius: 3.0,
                                      offset: Offset(0,
                                          0), // shadow direction: bottom right
                                    )
                                    ]),
                                child: Column(children: [
                                  Container(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.12,
                                    child: Image(fit: BoxFit.fill,
                                      image: NetworkImage(controller
                                          .homedata[i]["Photo"]),),),
                                  Container(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.017,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                      child: Center(child: FittedBox(
                                        child: AutoSizeText(
                                          controller.homedata[i]["Name"],
                                          //,maxFontSize: MediaQuery.of(context).textScaleFactor*9,minFontSize:MediaQuery.of(context).textScaleFactor*9,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  2, 44, 67, 1),
                                              fontWeight: FontWeight.bold),),
                                      ))),
                                  Container(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.017,
                                    margin: EdgeInsets.only(right: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01),
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Center(child: FittedBox(
                                            child: AutoSizeText(controller
                                                .homedata[i]["Description"],
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                      .of(context)
                                                      .textScaleFactor * 8,
                                                  color: Colors
                                                      .black54),)))),),
                                ],)
                                ,),
                            ),
                          );
                        })
                        : Container()
                  // Directionality(textDirection: TextDirection.rtl,
                  //   child: Container(
                  //     child:searchresult.length==0?Container(child: Center(child: Text("لا يوجد نتيجة متوافقة مع البحث"),),) :GridView.builder(physics: BouncingScrollPhysics(),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  //       childAspectRatio: (MediaQuery.of(context).size.width*1.5/MediaQuery.of(context).size.height*1.62),),itemCount: searchresult.length,itemBuilder: (context,i){
                  //       return Container(margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                  //         child: InkWell(onTap: ()=>showtoshowpage(i,searchresult[i]["Name"] , searchresult[i]["SubCategories"],true),
                  //           child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(
                  //             color: Colors.black12.withOpacity(0.2),
                  //             blurRadius: 1.0,
                  //             spreadRadius: 3.0,
                  //             offset: Offset(0,0), // shadow direction: bottom right
                  //           )]),child: Column(children: [
                  //             Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.12,child: Image(fit: BoxFit.fill,image: NetworkImage(searchresult[i]["Photo"]),),),
                  //             Container( height: MediaQuery.of(context).size.height*0.017,alignment: Alignment.center,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),child:Center(child:  FittedBox(
                  //               child: AutoSizeText(searchresult[i]["Name"],//,maxFontSize: MediaQuery.of(context).textScaleFactor*9,minFontSize:MediaQuery.of(context).textScaleFactor*9,
                  //                 style: TextStyle(color: Color.fromRGBO(2, 44, 67, 1),fontWeight: FontWeight.bold),),
                  //             ))),
                  //             Container(height: MediaQuery.of(context).size.height*0.017,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),child: Directionality(textDirection: TextDirection.rtl,child: Center(child: FittedBox(child: AutoSizeText(searchresult[i]["Description"], style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*8,color: Colors.black54),)))),),
                  //           ],)
                  //             ,),
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ) ,)  ,
                ),)
      ),
    ])),
  );
}

// var favdone = false;
// showtoshowpage(i,name,sub,sea)async{
//   if(!sea){
//     if(name == "مزاد"){
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//         return Mazadshow(mazads: homedata[i]["Auctions"],);
//       }));
//     }
//     else {
//       if(homedata[i]["SubCategories"] !=null) {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return Subcats(name:homedata[i]["Name"],data:homedata[i]["SubCategories"], tabcontroller: tabController,maincontext: context,);
//         }));
//       }else {
//         await Provider.of<Notifires>(context,listen: false).resetshowpagevalues();
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return Showpage(
//               id: homedata[i]["ID"], name: name, subcategories: sub,tabcontroller: tabController,maincontext: context,navigate : true);
//         }));
//       }
//     }
//   }
//   else{
//     if(name == "مزاد"){
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//         return Mazadshow(mazads: searchresult[i]["Auctions"],);
//       }));
//     }
//     else {
//       if(searchresult[i]["SubCategories"] !=null){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return Subcats(name:searchresult[i]["Name"],data:searchresult[i]["SubCategories"], tabcontroller: tabController,maincontext: context,);
//         }));
//       }else{
//         await Provider.of<Notifires>(context,listen: false).resetshowpagevalues();
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return Showpage(
//               id: searchresult[i]["ID"], name: name, subcategories: sub,tabcontroller: tabController,maincontext: context,navigate : true);
//         }));
//       }
//     }
//   }
// }
// navigatetolocation(){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context){
//     return Location();
//   }));
// }}