import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:search_nhentai/ImageList.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _imageFile;
  FileController fileController = Get.put(FileController());

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        fileController.setFile(_imageFile!);
        Get.toNamed('/ImageList');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        decoration:BoxDecoration(

          color:Color(0xFF222222),
          shape:BoxShape.circle,
        ),
        child: IconButton(
          iconSize: 50,
          onPressed: _pickImage,
          color: CupertinoColors.systemYellow,
          icon: Icon(Icons.add_a_photo),
        )
    );
  }
}
