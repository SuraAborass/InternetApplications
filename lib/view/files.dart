import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/file_item.dart';

class Files extends StatelessWidget {
  static const routename = '/files';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: thirdColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        //backgroundColor: fiColor,
        title:const Text("Files",style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
            return FileItem(
              DUMMY_Files[index].id,
              DUMMY_Files[index].name,
              DUMMY_Files[index].Url,
              DUMMY_Files[index].mode,
            );
          },
          itemCount: DUMMY_Files.length,
        ),
      ),
    );
  }
}
