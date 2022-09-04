import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:playbeat/Controllers/upload_controller.dart';
import 'package:playbeat/pages/Widgets/round_button.dart';

class UploadPage extends StatelessWidget {
  UploadPage({Key? key}) : super(key: key);

  final uploadController = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload your music'),
      ),
      body: SizedBox(
        height: size.height * 0.8,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputField(title: 'Title', hint: 'Enter title'),
                inputField(title: 'Singer', hint: 'Enter Singer Name'),
                inputField(title: 'Writer', hint: 'Enter Writer Name'),
                inputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(uploadController.selectedDate),
                  widget: Container(),
                ),
                Obx(
                  () => inputField(
                    title: 'Category',
                    hint: uploadController.selectedCategory.value,
                    widget: DropdownButton(
                      items: uploadController.categoryList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(
                                      value.toString(),
                                    ),
                                  ))
                          .toList(),
                      onChanged: (value) {
                        uploadController.selectedCategory.value =
                            value.toString();
                        log(uploadController.selectedCategory.value);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                inputField(
                  title: 'Image',
                  hint: 'Pick background image for music',
                  widget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                  ),
                ),
                Obx((() => inputField(
                      title: 'Media',
                      hint: uploadController.selectedSong.value,
                      widget: IconButton(
                        onPressed: uploadController.pickFile,
                        icon: const Icon(Icons.audio_file),
                      ),
                    ))),
                const SizedBox(
                  height: 30,
                ),
                RoundButton(
                    size: size,
                    onPress: () {
                      log(uploadController.musicFiles.length.toString());
                    },
                    text: 'Upload'),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container inputField({
    String? title,
    String? hint,
    TextEditingController? controller,
    Widget? widget,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 8),
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(22)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget != null)
                  Container(
                    child: widget,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
