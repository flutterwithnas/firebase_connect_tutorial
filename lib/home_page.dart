import 'dart:io';

import 'package:firebase_connect_tutorial/controller/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.pickImage();
                },
                child: const Text('Pick your Image'),
              ),
            ),
            Obx(() {
              return Container(
                child: controller.image.value.path == ''
                    ? const Icon(
                  Icons.camera,
                  size: 50,
                )
                    : Image.file(
                  File(controller.image.value.path),
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                controller.uploadImageToFirebase();

              },
              child: const Text('Upload to Firebase Storage'),
            ),
            Obx(() {
              return Image.network(controller.networkImage.value.toString());
            }),
          ],
        ),
      ),
    );
  }
}
