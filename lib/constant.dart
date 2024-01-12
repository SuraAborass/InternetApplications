import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/view/Add_File.dart';
import 'package:untitled/view/files.dart';
import 'package:untitled/view/groups.dart';
import 'package:untitled/view/my_file.dart';
import 'model/file.dart';
import 'model/group.dart';
import 'view/Add_Group.dart';


List<Widget> views =  [
  Files(),
  MyFiles(),
  Groups(),
  AddFile(),
  AddGroup(),
  //add_AD(),
];


 const Color firstColor = Color(0xff994d00);
const Color fiColor = Colors.brown;
Color fourColor = Colors.brown.withOpacity(0.5);

const Color secondaryColor = Color(0xff547388);
const Color thirdColor =Color(0xFFFFFFFF);

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);
const kTextFieldColor = Color(0xFF979797);
TextStyle titleText =
const TextStyle(color: firstColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: secondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton =const TextStyle(
  color: firstColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

 List<file> DUMMY_Files =[
  file(
    id:'11',
    name:'Rawan Ibrahim',
    Url:'kfjjkgjkdfkgkjdfgdjk',
    mode: Mode.chekIn,
  ),
  file(
    id:'12',
    name:'Sura Abo Ras',
    Url:'kfjjkgjkdfkgkjdfgdjk',
    mode: Mode.chekOut,
  ),
  file(
    id:'13',
    name:'Zahraa Al Sous',
    Url:'kfjjkgjkdfkgkjdfgdjk',
    mode: Mode.chekOut,
  ),
  file(
    id:'13',
    name:'Jamal Al Mourshed',
    Url:'kfjjkgjkdfkgkjdfgdjk',
    mode: Mode.chekIn,
  ),
];
List<group> DUMMY_group =[
  group(
      id:'1',
      name:'SponjPop',
      owner: user(name:'Rawan',email:'rawan@gmail.com',pass:'5565588'),
      members:[
        user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
        user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
        user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
      ],
  ),
  group(
    id:'2',
    name:'Doraimon',
    owner: user(name:'Sura',email:'rawan@gmail.com',pass:'5565588'),
    members:[
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
    ],
  ),
  group(
    id:'3',
    name:'Majed',
    owner: user(name:'Zahraa',email:'rawan@gmail.com',pass:'5565588'),
    members:[
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
      user(name:'rawan',email:'rawan@gmail.com',pass:'5565588'),
    ],
  ),

];