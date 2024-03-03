import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/controller/edit_provider.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/view/widgets/addscreen_widgets.dart';
import 'package:luxeride/view/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

import '../../controller/add_provider.dart';

class BikeEditScreen extends StatefulWidget {
  const BikeEditScreen(
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
  State<BikeEditScreen> createState() => _BikeEditScreenState();
}

class _BikeEditScreenState extends State<BikeEditScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    final editProvider = Provider.of<EditProvider>(context, listen: false);
    super.initState();
    editProvider.companycontroller.text = widget.companyName;
    editProvider.modelcontroller.text = widget.modelName;
    editProvider.powercontroller.text = widget.power;
    editProvider.torquecontroller.text = widget.torque.toString();
    editProvider.dailypricecontroller.text = widget.dailyPrice.toString();
    editProvider.monthlypricecontroller.text = widget.monthPrice.toString();
    editProvider.selectedImage =
        widget.imagepath != '' ? File(widget.imagepath) : null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProvider>(context);
    return Scaffold(
      body: Form(
        key: _formkey,
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
                                      'assets/images/avatarPerson.jpeg')
                                  as ImageProvider)),
                ),
                const Gap(10),
                FilledButtonWidget(
                    buttontext: 'ADD IMAGE',
                    onPressedButton: () {
                      provider.pickImageFromGallery();
                    }),
                AddFormField(
                    inputformat: r'[a-z,A-Z," "]',
                    keyboardType: TextInputType.text,
                    hintText: 'company name',
                    maxLength: 10,
                    controller: provider.companycontroller),
                AddFormField(
                    inputformat: r'[a-z,A-Z," ",0-9]',
                    keyboardType: TextInputType.text,
                    hintText: 'model name',
                    maxLength: 10,
                    controller: provider.modelcontroller),
                AddFormField(
                    inputformat: r'[a-z,A-Z," ",0-9]',
                    keyboardType: TextInputType.text,
                    hintText: 'horse power',
                    maxLength: 10,
                    controller: provider.powercontroller),
                AddFormField(
                    inputformat: r'[0-9]',
                    keyboardType: TextInputType.number,
                    hintText: 'torque',
                    maxLength: 10,
                    controller: provider.torquecontroller),
                AddFormField(
                    inputformat: r'[0-9]',
                    keyboardType: TextInputType.number,
                    hintText: 'daily price',
                    maxLength: 7,
                    controller: provider.dailypricecontroller),
                AddFormField(
                    inputformat: r'[0-9]',
                    maxLength: 10,
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
      ),
    );
  }

  void updateAll(BuildContext context) {
    final editButtonProvider =
        Provider.of<EditProvider>(context, listen: false);
    final newcompany = editButtonProvider.companycontroller.text.trim();
    final newmodel = editButtonProvider.modelcontroller.text.trim();
    final newpower = editButtonProvider.powercontroller.text.trim();
    final newtorque = editButtonProvider.torquecontroller.text.trim();
    final newdailyprice = editButtonProvider.dailypricecontroller.text.trim();
    final newmonthprice = editButtonProvider.monthlypricecontroller.text.trim();
    final newimage = editButtonProvider.selectedImage!.path;

    final update = BikesModel(
        companyName: newcompany,
        modelName: newmodel,
        horsePower: newpower,
        torque: int.parse(newtorque),
        priceDay: int.parse(newdailyprice),
        priceMonth: int.parse(newmonthprice),
        image: newimage);

    Provider.of<DbProvider>(context, listen: false)
        .editVehicle(DataBases.bikeDataBase, update, widget.index);
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
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ));
  }
}
