import 'package:get/get.dart';
import 'package:untitled/Controller/register_controller.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }

}