import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';
import '../constant.dart';
import 'auth.dart';

class Main_page extends StatefulWidget {
  const Main_page({Key? key}) : super(key: key);
  static const routeName = '/Main_page';
  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fourColor,
      body: SafeArea(
          child: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            theme: SideNavigationBarTheme(
              backgroundColor: thirdColor,
              togglerTheme: SideNavigationBarTogglerTheme.standard(),
              dividerTheme: SideNavigationBarDividerTheme.standard(),
              itemTheme: SideNavigationBarItemTheme(
                selectedItemColor: firstColor,
                unselectedItemColor: Colors.black,
              ),
            ),
            items: const [
              SideNavigationBarItem(
                icon: Icons.file_copy,
                label: 'Reserved Files',
              ),
              SideNavigationBarItem(
                icon: Icons.insert_drive_file,
                label: 'My Files',
              ),
              SideNavigationBarItem(
                icon: Icons.group_work,
                label: 'My Groups',
              ),
              SideNavigationBarItem(
                icon: Icons.add_circle_outline,
                label: 'Add File',
              ),
              SideNavigationBarItem(
                icon: Icons.maps_ugc_sharp,
                label: 'Add Group',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
           Container(
             color: thirdColor,
             child:
           SizedBox(
            height: double.infinity,
            width:40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                    Get.offAllNamed('/Auth');
                    //Navigator.of(context).pushNamed(Auth.routeName);
                    },
                  icon: const Icon(Icons.logout),
                  color: firstColor,
                ),
              ],
            ),
          ),
           ),
          Expanded(
            child: views.elementAt(selectedIndex),
          ),
        ],
      )),
    );
  }
}
