import 'dart:convert';
import 'package:get/get.dart';
import 'package:untitled/config/server_config.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import '../widget/snackbar.dart';

class SignUpService{

  var massege;

  var url=Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);


  Future<bool> register(user user) async {
    print('nameeeeeeeeeeeee${user.name}');
    print('emailllllllllllllll${user.email}');
    print('passssssssssssss${user.pass}');
    print(url);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode( {
        'name': user.name,
        'email': user.email,
        'password': user.pass,
        'confirmpassword':user.passC,
        //'passwordConfirm':user.
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      //print(response.statusCode);
      var jsonResponse = jsonDecode(response.body);
      massege = jsonResponse['massege'];
      print('mmmmmmmmmmmmm   ${massege}');
      Get.toNamed('/Main_page');
      SnackBars.showSuccess('Success...');
    return true;
    }
    else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      massege = jsonResponse['email'];
      SnackBars.showError('This Account is Already Created');
      return false;
    } else {
      var jsonResponse = jsonDecode(response.body);
      massege = jsonResponse['massege'];
      return false;
    }
  }
}