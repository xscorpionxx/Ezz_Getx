import 'dart:io';
import 'package:ezzproject/views/Auth/Loginpage.dart';
import 'package:ezzproject/views/Auth/Signup.dart';
import 'package:ezzproject/views/Loading/Loading.dart';
import 'package:ezzproject/views/Main_pages/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/Middle_wares.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    if (message.notification.title.toString() == "1") {
      FlutterRestart.restartApp();
    }
  }
}
SharedPreferences sharedPreferences;
void main() async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ));
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences?.getInstance() as SharedPreferences ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ezz',
      theme:
      ThemeData(fontFamily: 'Tajawal') ,
        initialRoute: "/loading",
      getPages: [
        //GetPage(name: "/home2", page: ()=>Home2()),
        GetPage(name: "/login", page: ()=>Loginpage()),
        GetPage(name: "/loading", page: ()=>Loadingpage() , middlewares: [Auth1()] ),
        GetPage(name: "/home", page: ()=>Bottom_nav())
        ,GetPage(name: "/signup", page: ()=>Signuppage())
        //GetPage(name: "/home", page:()=> Homepage() ,middlewares: [Auth()]),
        //GetPage(name: "/main", page:()=> Mainpage()),
        //GetPage(name: "/App", page:()=> App()),
      ],
    );
    // mainlogic.gettoken();
    // return //MaterialApp(theme: ThemeData(fontFamily: 'Tajawal'), title: "Ezz", debugShowCheckedModeBanner: false, home:  Home() );
    //
    //   FutureBuilder(future: mainlogic.getdata() , builder: (context ,snapshot ){
    //   if(snapshot.hasError){
    //     return MaterialApp(theme: ThemeData(fontFamily: 'Tajawal'),
    //         title: "Ezz",debugShowCheckedModeBanner: false,
    //       home: Loginpage());
    //   }
    //   if(snapshot.connectionState ==ConnectionState.done){
    //     if(mainlogic.data["token"] !=null &&mainlogic.data["phone"] !=null ) {
    //         return FutureBuilder(future: mainlogic.login(
    //             mainlogic.data["phone"],mainlogic.data["password"]),
    //             builder: (context, snapshot)  {
    //               if (snapshot.hasError) {
    //                 Fluttertoast.showToast(
    //                     msg: mainlogic.message.toString() =="null"?"الرجاء اعادة محاولة تسجيل الدخول":mainlogic.messageso.toString(),
    //                     toastLength: Toast.LENGTH_SHORT,
    //                     gravity: ToastGravity.BOTTOM,
    //                     timeInSecForIosWeb: 1,
    //                     backgroundColor: Colors.grey,
    //                     textColor: Colors.white,
    //                     fontSize: 16.0
    //                 );
    //                 return MaterialApp(theme: ThemeData(fontFamily: 'Tajawal'),
    //                     title: "Ezz",
    //                     debugShowCheckedModeBanner: false,
    //                     home: Loginpage());
    //               }
    //               if (snapshot.connectionState == ConnectionState.done) {
    //                 if (mainlogic.status == true) {
    //                   if(mainlogic.accountstatus.toString().trim() =="1"){
    //                   }
    //                   else{
    //                     return MaterialApp(
    //                         theme: ThemeData(fontFamily: 'Tajawal'),
    //                         title: "Ezz",
    //                         debugShowCheckedModeBanner: false,
    //                         home: Codeconf(type: mainlogic.type,phone:mainlogic.data["phone"] ,) // mainlogic.type == "تاجر"
    //                              //Section1(username: data,)
    //                     );
    //                   }
    //                 }
    //                 else {
    //                   Fluttertoast.showToast(
    //                       msg: mainlogic.message.toString() =="null"?"الرجاء اعادة محاولة تسجيل الدخول":mainlogic.messageso.toString(),
    //                       toastLength: Toast.LENGTH_SHORT,
    //                       gravity: ToastGravity.BOTTOM,
    //                       timeInSecForIosWeb: 1,
    //                       backgroundColor: Colors.grey,
    //                       textColor: Colors.white,
    //                       fontSize: 16.0
    //                   );
    //                   return MaterialApp(
    //                       theme: ThemeData(fontFamily: 'Tajawal'),
    //                       title: "Ezz",
    //                       debugShowCheckedModeBanner: false,
    //                       home: Loginpage()
    //                   );
    //                 }
    //               }
    //               return MaterialApp(
    //                 title: "Loading", debugShowCheckedModeBanner: false,
    //                 theme: ThemeData(fontFamily: 'Tajawal'),
    //                 home: Scaffold(
    //                   body: Center(child: CircularProgressIndicator()),),);
    //             });
    //     }
    //     else{
    //       return MaterialApp(theme: ThemeData(fontFamily: 'Tajawal'),title: "Ezz",debugShowCheckedModeBanner: false,
    //           home: Loginpage()
    //       );
    //     }
    //   }
    //   return MaterialApp(title:"Loading",debugShowCheckedModeBanner: false,
    //     theme: ThemeData(fontFamily: 'Tajawal'),
    //     home: Scaffold(body: Center(child: CircularProgressIndicator()),),);
    // },);
  }
}
