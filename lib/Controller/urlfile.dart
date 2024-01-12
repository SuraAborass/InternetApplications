import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
   String filePath = '';

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4', 'webm'],
    );

    if (result != null) {
      filePath = result.files.single.path!;
      update();
    }
  }
}