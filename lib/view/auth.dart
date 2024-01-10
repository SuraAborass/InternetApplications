import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constant.dart';
import 'login_view.dart';
import 'signup_view.dart';

class Auth extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(30.r),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              firstColor,
              fiColor,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Welcome To Our App...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () => Get.to(SignUpView()),
                  child: Container(
                    height: 60.h,
                    width: 200.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent.withOpacity(0.12),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () => Get.to(LogInView()),
                  child: Container(
                    height: 60.h,
                    width: 200.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent.withOpacity(0.12),
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
