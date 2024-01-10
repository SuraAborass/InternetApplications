import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/Controller/register_controller.dart';
import 'package:untitled/extensions/validation.dart';

import '../constant.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

 // RegisterController controller = Get.find();

  RegisterController controller = Get.put<RegisterController>(RegisterController());

  //final _formKey = GlobalKey<FormState>();
  var username = '';
  var password = '';
  var email = '';
  bool _showPassword = true;
  bool _showPassword2 = true;
  final _passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          centerTitle: true,
           title: const Text(
            'Sgin Up',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                firstColor,
                fiColor,
                // Colors.blue,
              ],
            )),
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height:30.h,
                    ),
                    /// user Name
                    TextFormField(
                      validator: (value) => value!.length < 5
                          ? 'Please Enter more than 5 characters'
                          : null,
                      onSaved: (value) => username = value!,
                      onChanged:(val){
                       controller.fullName= val;
                      } ,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          // focusedBorder: OutlineInputBorder(),
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Username",
                          hintText: "username",
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.5))),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    /// email
                    TextFormField(
                      validator: ((value) => value!.isValidEmail()),
                      onSaved: (value) => email = value!,
                      onChanged:(val){
                        controller.email= val;
                      } ,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.email_rounded),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Email",
                          hintText: 'username@example.com',
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.5))),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    /// password
                    TextFormField(
                      validator: (value) => value!.isValidPassword(),
                      onSaved: (value) => password = value!,
                      onChanged:(val){
                        controller.password= val;
                      } ,
                      controller: _passwordController,
                      obscureText: _showPassword,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: _showPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          icon: const Icon(Icons.key_rounded),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Password",
                          hintText: '**********',
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.5))),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    /// confirm password
                    TextFormField(
                      validator: (val) {
                        if (val != _passwordController.text) {
                          return 'Password Do Not Match!..';
                        }
                        return null;
                      },
                      onSaved: (value) => password = value!,
                      onChanged:(val){
                       controller.passwordConfirm= val;
                      } ,
                      obscureText: _showPassword2,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword2 = !_showPassword2;
                                });
                              },
                              icon: _showPassword2
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          icon: const Icon(Icons.key_rounded),
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusColor: Theme.of(context).primaryColor,
                          labelText: "Confirm Password",
                          hintText: '**********',
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.red, width: 2.5))),

                    ),
                    SizedBox(height: 60.h),
                    /// submit
                    InkWell(
                      // splashColor: Colors.green,
                      onTap: () {
                          onclickRegister();
                      },
                      child: Container(
                        height: 60.r,
                        width:  300.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                firstColor,
                                fiColor,
                                // Colors.blue,
                              ],
                            )),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );

  void onclickRegister() {
    controller.registerOnClick();

  }
}