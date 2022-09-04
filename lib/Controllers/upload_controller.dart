import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class UploadController extends GetxController {
  List<PlatformFile> musicFiles = [];
  DateTime selectedDate = DateTime.now();
  RxString selectedCategory = 'Choose category'.obs;
  RxString selectedSong = 'Choose media'.obs;

  List<String> categoryList = [
    'Pop',
    'Rock',
    'Hip Hop',
    'Electronic',
    'Classic'
  ];

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result == null) return;
    PlatformFile? file = result.files.first;
    selectedSong.value = file.name.toString();
    musicFiles.add(file);

    log('File Uploaded');
  }

  void openFile(int i) async {
    await OpenFile.open(musicFiles[i].path);
  }
}
