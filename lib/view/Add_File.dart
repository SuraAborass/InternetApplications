import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:untitled/extensions/validation.dart';
import '../Controller/urlfile.dart';
import '../constant.dart';
import '../model/file.dart';

class AddFile extends StatefulWidget {
  const AddFile({Key? key}) : super(key: key);

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  //final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fileurlcontroller ;
  final _fileUrlFocusNode = FocusNode();

  //final FilePickerController controller = Get.put(FilePickerController());

  file newfile=file(
      id:null,
      name:'',
      Url:'',
      mode: Mode.chekOut
  );
  final _initialValue = {
   'name':'',
    'Url':'',
   'mode': Mode.chekOut
  };
  ///late final String urlfile;

  @override
  void initState() {
    super.initState();
    _fileurlcontroller = TextEditingController();
    _fileUrlFocusNode.addListener(_updatefileUrl);
  }

  @override
  void dispose() {
    _fileurlcontroller.dispose();
    //_imageUrlFocusNode.removeListener(_updateImageUrl);

    super.dispose();
  }

  void _updatefileUrl() {
    if (!_fileUrlFocusNode.hasFocus) {
      setState(() {});
    }
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
                print(_fileurlcontroller.text);
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
                //initialValue: _initialValue['name'],
                cursorColor:secondaryColor,
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
                onSaved:(value) {
                  newfile=file(
                    id: newfile.id,
                    name: value!,
                    mode:Mode.chekOut,
                    Url:newfile.Url,
                  );
                },
              ),
              /// Add Url
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      //initialValue: _initialValue!['Url'],
                      controller: _fileurlcontroller,
                      keyboardType: TextInputType.url,
                      focusNode: _fileUrlFocusNode,
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
                                _fileurlcontroller.text = filePath ?? '';
                                newfile=file(
                                  id: newfile.id,
                                  name: newfile.name,
                                  mode:Mode.chekOut,
                                  Url:filePath,
                                );
                                // القيام بأي عملية تحتاج إلى مسار الملف هنا
                              } else {
                                // المستخدم لم يقم باختيار أي ملف
                              }
                            },
                            icon: const Icon(Icons.insert_drive_file),
                          ),
                          labelText:"Url",
                          labelStyle:const TextStyle(
                            color: kTextFieldColor,
                          )
                      ),
                      validator: ((value) => value!.isValidurl()),
                      onSaved: (value){
                        newfile=file(
                            id: newfile.id,
                            name: newfile.name,
                            mode:Mode.chekOut,
                            Url:value!,
                        );
                        //url = value!
                      },
                      onChanged: (value) {
                        setState(() {
                        }); // إعادة بناء الواجهة لعرض قيمة المسار المحدثة
                      },
                      textInputAction: TextInputAction.next,
                      style:const TextStyle(color: Colors.black),
                      ////initialValue: "url",
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
