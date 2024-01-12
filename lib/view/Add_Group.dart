import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untitled/extensions/validation.dart';
import '../constant.dart';
import '../model/group.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  var name = '';
  var members = [];
  //final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final  _members= <Member>[];
  late TextEditingController _controller ;

  group newgroup=group(
      id:null,
      owner: null,
      name:'',
      members: [],
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    //_imageUrlFocusNode.removeListener(_updateImageUrl);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        //backgroundColor:fiColor,
        title:const Text("Add Group",
          style:TextStyle(fontSize:30,fontWeight: FontWeight.bold),
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
        actions: [
          Row(
            children:[
              IconButton(onPressed:(){
                print(_controller.text);
              }, icon: const Icon(Icons.save)),
              const SizedBox(width:15),
            ],
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          //key: _formKey,
          child: ListView(
            children: [
              /// Add a Title
              TextFormField(
                cursorColor:secondaryColor,
                //initialValue: _initialValue['name'],
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: firstColor,
                        width: 2,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                    border: const UnderlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText:"Title of Group",labelStyle:const TextStyle(
                  fontSize:25,
                  color:firstColor,
                  fontWeight: FontWeight.bold,

                )
                ),
                style:const TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                validator: (value) => value!.length< 5
                    ? 'Please Enter more than 5 characters'
                    : null,
                onSaved:(value) => name = value!,
              ),
              /// Add memberemails
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Add Members of Group',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                       // fontFamily: 'SegoeMarker',
                        color:firstColor,
                        fontSize:18,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ..._members,
                          const SizedBox(height: 16),
                          IconButton(
                              onPressed: () {
                                _add_ingredient();
                              },
                              icon: const Icon(Icons.add,
                                  color:firstColor,
                              ),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ///Button Add
             /* Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 15),
                child: SizedBox(
                  height: deviceSize.width/5,
                  width: deviceSize.width/2,
                  child: ElevatedButton(
                    onPressed: () {
                      //print('Button pressed ...');
                    },
                    child: Text(
                      'Add a New member',
                      style: TextStyle(
                        //fontFamily: 'SegoeMarker',
                        color: Color(0xFF1A2239),
                        fontSize: deviceSize.width/18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff994d00)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.fromLTRB(24, 15, 24, 15)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      elevation: MaterialStateProperty.all<double>(3.0),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void _add_ingredient() {
  setState(() {
  _members.add(const Member());
  });
  }
}

///////////////////////////////// Member

class Member extends StatefulWidget {
  const Member({Key? key}) : super(key: key);

  @override
  _MemberState createState() => _MemberState();
}
class _MemberState extends State<Member> {
  String? _ingraDescription;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                //labelText: "member",
                labelStyle: TextStyle(color: Color(0xff1A2239)),
                hintText: "Enter the Email Of Member",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff1A2239),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: firstColor,
                    width: 2,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an email or user name";
                }
                return null;
              },
              onSaved: (value) {
                _ingraDescription = value;
              },
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

