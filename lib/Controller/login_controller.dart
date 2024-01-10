import 'package:get/get.dart';

import '../config/login_service.dart';
import '../model/user.dart';

class LoginController extends GetxController{

  late String email ;
  var password ;
  var loginStatus ;
  var message;
  var checkBoxStatus ;

  late LoginService service ;

  @override
  void onInit() {
    email = '';
    password = '';
    loginStatus = false;
    message = '';
    checkBoxStatus = false.obs;
    service = LoginService();
    super.onInit();
  }
  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);
  }

  Future<void> loginOnClick() async {
    user User = user(
      email: email,
      pass: password,
    );
    loginStatus = await service.login(User);
    message = service.message;
    if(message is List){
      String temp = '';
      for(String s in  message) temp += s + '\n';
      message = temp;
    }
  }
}