import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProvider extends ChangeNotifier {
  final companycontroller = TextEditingController();
  final modelcontroller = TextEditingController();
  final powercontroller = TextEditingController();
  final torquecontroller = TextEditingController();
  final dailypricecontroller = TextEditingController();
  final monthlypricecontroller = TextEditingController();
  File? selectedImage;
  final formkey = GlobalKey<FormState>();

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    selectedImage = File(returnImage.path);

    notifyListeners();
  }
}
