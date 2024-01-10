
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../widget/snackbar.dart';
import 'server_config.dart';
import 'user_information.dart';

class LoginService {

  var message;
  var token;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> login(user User) async {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        'email': User.email,
        'password': User.pass,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      //message = jsonResponse['massege'];
      token = jsonResponse['token'];
      UserInformation.USER_TOKEN = token;
      Get.toNamed('/Main_page');
      SnackBars.showSuccess('Success Login...');
      return true;
    }
    else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      //message = jsonResponse['massege'];
      SnackBars.showError('Your Data is not Correct..');
      return false;
    }
    else {
      //message = 'server error';
      SnackBars.showError('Server error..');
      return false;
    }
  }
}