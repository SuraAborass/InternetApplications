import 'package:get/get.dart';
import '../model/user.dart';
import '../config/register_service.dart';

class RegisterController extends GetxController{
  var fullName;
  var email;
  var password;
  var passwordConfirm;
  var signUpStatus = false;
  var message;

  SignUpService service = SignUpService();

  Future<void> registerOnClick() async{
    user User = user( name: fullName, email: email, pass:password,passC:passwordConfirm );
  signUpStatus = await service.register(User);
  message = service.massege;
  if(message is List){
    String temp = '';
    for(String s in  message) temp += s + '\n';
    message = temp;
  }
}


}