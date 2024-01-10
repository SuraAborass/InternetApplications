import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untitled/extensions/validation.dart';
import '../constant.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  var name = '';
  var url = 'url';
  //final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller ;
  ///late final String urlfile;

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
    return Scaffold(
      //backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        //backgroundColor:fiColor,
        title:const Text("Add File",
          style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
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
            children: [
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
                    focusColor: Theme.of(context).primaryColor,
                    border: const UnderlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText:"Title",labelStyle:const TextStyle(
                    color:kTextFieldColor,
                )
                ),
                style:const TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                validator: (value) => value!.length< 5
                    ? 'Please Enter more than 5 characters'
                    : null,
                onSaved:(value) => name = value!,
              ),
              /// Add Url
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.name,
                      decoration:InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          border: const UnderlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 2.5)),
                          suffixIcon:IconButton(
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['txt'],
                              );
                              if (result != null) {
                                String? filePath = result.files.single.path!;
                                _controller.text = filePath ?? '';
                                //url = filePath;
                                // القيام بأي عملية تحتاج إلى مسار الملف هنا
                              } else {
                                // المستخدم لم يقم باختيار أي ملف
                              }
                            },
                            icon: const Icon(Icons.insert_drive_file),
                          ),
                          labelText:"Url",
                          labelStyle:TextStyle(
                            color: kTextFieldColor,
                          )
                      ),
                      validator: ((value) => value!.isValidurl()),
                      onSaved: (value) => url = value!,
                      onChanged: (value) {
                        setState(() {

                        }); // إعادة بناء الواجهة لعرض قيمة المسار المحدثة
                      },
                      textInputAction: TextInputAction.next,
                      style:const TextStyle(color: Colors.black),
                      ////initialValue: "url",
                      ///onFieldSubmitted: (_) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
