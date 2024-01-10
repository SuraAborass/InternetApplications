import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/view/main-page.dart';
import 'getx_binding/login_binding.dart';
import 'getx_binding/main_page_binding.dart';
import 'getx_binding/sign_up_binding.dart';
import 'view/auth.dart';
import 'view/files.dart';
import 'view/login_view.dart';
import 'view/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/Auth',
      title:'MyApp',
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      home:ScreenUtilInit(builder: (_,Widget? child) =>Auth()),
      getPages:[
        GetPage(name:'/Auth', page:()=>Auth()),
        GetPage(name:'/register', page:()=>SignUpView(), binding: SignUpBinding()),
        GetPage(name:'/login', page:()=>LogInView(), binding: LoginBinding()),
        GetPage(name:'/Main_page', page:()=>Main_page(),binding:MainPageBinding()),
        GetPage(name: '/files', page:()=>Files()),
      ],

    );
  }
}
