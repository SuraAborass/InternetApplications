import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/group_item.dart';

class Groups extends StatelessWidget {
  static const routename = '/groups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: thirdColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        //backgroundColor: fiColor,
        title:const Text("My Groups",style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return GroupItem(
              DUMMY_group[index].id!,
              DUMMY_group[index].name,
              DUMMY_group[index].owner!,
              DUMMY_group[index].members,
            );
          },
          itemCount: DUMMY_group.length,
        ),
      ),
    );
  }
}
