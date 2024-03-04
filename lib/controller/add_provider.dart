import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum DataBases { carDataBase, bikeDataBase, bookingsDataBase }

enum Pack { daily, monthly }

class AddProvider extends ChangeNotifier {
  DataBases selectedDatabase = DataBases.carDataBase;
  Pack selectedPackValue = Pack.daily;
  final companycontroller = TextEditingController();
  final modelcontroller = TextEditingController();
  final powercontroller = TextEditingController();
  final torquecontroller = TextEditingController();
  final dailypricecontroller = TextEditingController();
  final monthlypricecontroller = TextEditingController();
  File? selectedImage;
  final formkey = GlobalKey<FormState>();

  void selectedDb(value) {
    selectedDatabase = value!;
    notifyListeners();
  }

  void selectedPack(value) {
    selectedPackValue = value!;
    notifyListeners();
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    selectedImage = File(returnImage.path);
    notifyListeners();
  }

  void clearSelectedImage() {
    selectedImage = null;
    notifyListeners();
  }
}
