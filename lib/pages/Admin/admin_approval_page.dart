import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/Admin/add_category.dart';
import 'package:playbeat/pages/Widgets/music_container.dart';

class AdminApproval extends StatelessWidget {
  const AdminApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Approval'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddCategory());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: MusicContainer(
          isAdmin: true,
        ),
      ),
    );
  }
}
