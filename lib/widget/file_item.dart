import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/file.dart';

class FileItem extends StatelessWidget {
  final String id;
  final String name;
  final String Url;
  final Mode mode;

  const FileItem(
      this.id,
      this.name,
      this.Url,
      this.mode,
      );

  String get modeText {
    switch (mode) {
      case Mode.chekIn:
        return 'Chek In ';
        break;
      case Mode.chekOut:
        return 'Chek Out';
        break;
      default :
        return 'Unknown';
        break;
    }
  }

  Color get col{
    if (modeText=='Chek In ')return Colors.green;
    else return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    final scafold = Scaffold.of(context);

    return ListTile(
      title: Text(name,style: const TextStyle(color: Colors.brown),),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/ff.png')
      ),
      trailing: SizedBox(
        width:150,
        child: Row(
          children:[
            Text(modeText,style:TextStyle(fontWeight: FontWeight.bold,color:col),),
           const SizedBox(width:20,),
            IconButton(
              icon: const Icon(Icons.download_rounded),
              color: kTextFieldColor,
              onPressed: ()=>{

              }
            ),
          ],
        ),
      ),
    );
  }
}
