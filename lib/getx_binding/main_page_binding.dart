import 'package:get/get.dart';
import '../Controller/files_controller.dart';

class MainPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<filesController>(filesController());
  }

}