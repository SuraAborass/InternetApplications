import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/user.dart';

class GroupItem extends StatelessWidget {
  final String id;
  final String name;
  final user owner;
  final List<user> members;

   const GroupItem(
     this.id,
      this.name,
      this.owner,
      this.members,
      );
  @override
  Widget build(BuildContext context) {
    final scafold = Scaffold.of(context);

    return ListTile(
      title: Text(name,style: const TextStyle(fontWeight: FontWeight.bold,color:Colors.brown),),
      leading: IconButton(
          icon: const Icon(Icons.group),
          color: firstColor,
          onPressed: () => {}
      ),
      trailing: SizedBox(
        width:150,
        child: Row(
          children:[
            Text('Owner is '+owner.name!,style:const TextStyle(color:firstColor),),
            const SizedBox(width:10,),
            Text(members.length.toString(),style:const TextStyle(fontWeight: FontWeight.bold,color:kTextFieldColor),),
            // const SizedBox(width:5,),
            /*IconButton(
                icon: const Icon(Icons.visibility),
                color: kTextFieldColor,
                onPressed: () => {}
            ),*/
          ],
        ),
      ),
    );
  }
}
