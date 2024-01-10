import 'package:untitled/model/user.dart';

class group{
  final String id;
  final String name;
  final user owner;
  final List<user> members;
  group({required this.id,required this.name,required this.owner,required this.members,});
}