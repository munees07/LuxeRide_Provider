import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/controller/edit_provider.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:luxeride/view/widgets/addscreen_widgets.dart';
import 'package:luxeride/view/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

import '../../controller/add_provider.dart';

class CarEditScreen extends StatefulWidget {
  const CarEditScreen(
      {super.key,
      required this.index,
      required this.companyName,
      required this.modelName,
      required this.power,
      required this.torque,
      required this.dailyPrice,
      required this.monthPrice,
      this.imagepath});

  final String companyName;
  final String modelName;
  final String power;
  final int torque;
  final int dailyPrice;
  final int monthPrice;
  final int index;
  final dynamic imagepath;

  @override
  State<CarEditScreen> createState() => _CarEditScreenState();
}

class _CarEditScreenState extends State<CarEditScreen> {

  @override
  void initState() {
    final editProvider = Provider.of<EditProvider>(context, listen: false);

    editProvider.companycontroller.text = widget.companyName;
    editProvider.modelcontroller.text = widget.modelName;
    editProvider.powercontroller.text = widget.power;
    editProvider.torquecontroller.text = widget.torque.toString();
    editProvider.dailypricecontroller.text = widget.dailyPrice.toString();
    editProvider.monthlypricecontroller.text = widget.monthPrice.toString();
    editProvider.selectedImage =
        widget.imagepath != '' ? File(widget.imagepath) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('eeeeeee');
    return Scaffold(
      body: Consumer<EditProvider>(builder: (context, provider, child) {
        return Form(
          key: provider.formkey,
          child: SingleChildScrollView(
            child: Container(
              color: const Color(0x00f3f5f7),
              child: Column(
                children: [
                  const Gap(30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 150,
                    child: Card(
                      shadowColor: Colors.black54,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image(
                          fit: BoxFit.contain,
                          image: provider.selectedImage != null
                              ? FileImage(
                                  provider.selectedImage!,
                                )
                              : const AssetImage(
                                      'assets/images/addimage.png')
                                  as ImageProvider),
                    ),
                  ),
                  const Gap(10),
                  FilledButtonWidget(
                      buttontext: 'ADD IMAGE',
                      onPressedButton: () {
                        provider.pickImageFromGallery();
                      }),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[a-z,A-Z," "]',
                      keyboardType: TextInputType.text,
                      hintText: 'company name',
                      controller: provider.companycontroller),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[a-z,A-Z," ",0-9]',
                      keyboardType: TextInputType.text,
                      hintText: 'model name',
                      controller: provider.modelcontroller),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[a-z,A-Z," ",0-9]',
                      keyboardType: TextInputType.text,
                      hintText: 'horse power',
                      controller: provider.powercontroller),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.number,
                      hintText: 'torque',
                      controller: provider.torquecontroller),
                  AddFormField(
                      maxLength: 7,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.number,
                      hintText: 'daily price',
                      controller: provider.dailypricecontroller),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.number,
                      hintText: 'monthly price',
                      controller: provider.monthlypricecontroller),
                  const Gap(10),
                  FilledButtonWidget(
                      buttontext: 'UPDATE',
                      onPressedButton: () {
                        updateAll(context);
                      })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

   updateAll(BuildContext context) {
    final editButtonProvider =
        Provider.of<EditProvider>(context, listen: false);
    final newcompany = editButtonProvider.companycontroller.text.trim();
    final newmodel = editButtonProvider.modelcontroller.text.trim();
    final newpower = editButtonProvider.powercontroller.text.trim();
    final newtorque = editButtonProvider.torquecontroller.text.trim();
    final newdailyprice = editButtonProvider.dailypricecontroller.text.trim();
    final newmonthprice = editButtonProvider.monthlypricecontroller.text.trim();
    final newimage = editButtonProvider.selectedImage!.path;

    final update = CarsModel(
        companyName: newcompany,
        modelName: newmodel,
        horsePower: newpower,
        torque: int.parse(newtorque),
        priceDay: int.parse(newdailyprice),
        priceMonth: int.parse(newmonthprice),
        image: newimage);

     Provider.of<DbProvider>(context, listen: false)
        .editVehicle(DataBases.carDataBase, update, widget.index);

    dialogue(context);
  }

  void dialogue(BuildContext context) {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: const Text('Changes Applied!'),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ));
  }
}
