import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/controller/add_provider.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:luxeride/view/widgets/addscreen_widgets.dart';
import 'package:luxeride/view/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('zzz');

    return Scaffold(
      body: Consumer<AddProvider>(builder: (context, addScreenProvider, child) {
        return Form(
          key: addScreenProvider.formkey,
          child: SingleChildScrollView(
            child: Container(
              color: const Color(0x00f3f5f7),
              child: Column(
                children: [
                  const Gap(60),
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
                            image: addScreenProvider.selectedImage != null
                                ? FileImage(addScreenProvider.selectedImage!)
                                : const AssetImage('assets/images/addimage.png')
                                    as ImageProvider)),
                  ),
                  const Gap(10),
                  FilledButtonWidget(
                      buttontext: 'ADD IMAGE',
                      onPressedButton: () {
                        addScreenProvider.pickImageFromGallery();
                      }),
                  DropdownButton<DataBases>(
                    value: addScreenProvider.selectedDatabase,
                    items: const [
                      DropdownMenuItem(
                          value: DataBases.carDataBase, child: Text('Cars')),
                      DropdownMenuItem(
                          value: DataBases.bikeDataBase, child: Text('Bikes')),
                    ],
                    onChanged: (value) {
                      // setState(() {
                      //   addScreenProvider.selectedDatabase = value!;
                      // });
                      addScreenProvider.selectedDb(value);
                    },
                  ),
                  const Gap(10),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[a-z,A-Z," "]',
                      keyboardType: TextInputType.text,
                      hintText: 'company name',
                      controller: addScreenProvider.companycontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a company name';
                        } else {
                          return null;
                        }
                      }),
                  AddFormField(
                      maxLength: 20,
                      inputformat: r'[a-z,A-Z," ",0-9]',
                      keyboardType: TextInputType.text,
                      hintText: 'model name',
                      controller: addScreenProvider.modelcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a model name';
                        } else {
                          return null;
                        }
                      }),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[a-z,A-Z," ",0-9]',
                      keyboardType: TextInputType.text,
                      hintText: 'horse power',
                      controller: addScreenProvider.powercontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a horse power';
                        } else {
                          return null;
                        }
                      }),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.text,
                      hintText: 'torque',
                      controller: addScreenProvider.torquecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a torque';
                        } else {
                          return null;
                        }
                      }),
                  AddFormField(
                      maxLength: 7,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.number,
                      hintText: 'daily price',
                      controller: addScreenProvider.dailypricecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a daily price';
                        } else {
                          return null;
                        }
                      }),
                  AddFormField(
                      maxLength: 10,
                      inputformat: r'[0-9]',
                      keyboardType: TextInputType.number,
                      hintText: 'monthly price',
                      controller: addScreenProvider.monthlypricecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a monthly price';
                        } else {
                          return null;
                        }
                      }),
                  const Gap(10),
                  FilledButtonWidget(
                      buttontext: 'ADD',
                      onPressedButton: () {
                        if (addScreenProvider.formkey.currentState!
                            .validate()) {
                          onAddClicked(context);
                        }
                      }),
                  const Gap(10)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void onAddClicked(BuildContext context) {
    final addButtonProvider = Provider.of<AddProvider>(context, listen: false);
        final company = addButtonProvider.companycontroller.text.trim();
      final model = addButtonProvider.modelcontroller.text.trim();
      final power = addButtonProvider.powercontroller.text.trim();
      final torque = addButtonProvider.torquecontroller.text.trim();
      final dailyprice = addButtonProvider.dailypricecontroller.text.trim();
      final monthlyprice = addButtonProvider.monthlypricecontroller.text.trim();
      if (company.isEmpty ||
          model.isEmpty ||
          power.isEmpty ||
          torque.isEmpty ||
          dailyprice.isEmpty ||
          monthlyprice.isEmpty) {
        return;
      }
      addButtonProvider.companycontroller.clear();
      addButtonProvider.modelcontroller.clear();
      addButtonProvider.powercontroller.clear();
      addButtonProvider.torquecontroller.clear();
      addButtonProvider.dailypricecontroller.clear();
      addButtonProvider.monthlypricecontroller.clear();
      addButtonProvider.selectedImage==null;

      log('$company $model $power $torque $dailyprice $monthlyprice');
    if (addButtonProvider.selectedDatabase ==DataBases.carDataBase) {
      final car = CarsModel(
          companyName: company,
          modelName: model,
          horsePower: power,
          torque: int.parse(torque),
          priceDay: int.parse(dailyprice),
          priceMonth: int.parse(monthlyprice),
          image: addButtonProvider.selectedImage!.path);
      Provider.of<DbProvider>(context, listen: false)
          .addVehicle(DataBases.carDataBase, car);
      // add(DataBases.carDataBase, car);
    } else if (addButtonProvider.selectedDatabase == DataBases.bikeDataBase) {
      final bike = BikesModel(
          companyName: company,
          modelName: model,
          horsePower: power,
          torque: int.parse(torque),
          priceDay: int.parse(dailyprice),
          priceMonth: int.parse(monthlyprice),
          image: addButtonProvider.selectedImage!.path);
      // add(DataBases.bikeDataBase, bike);
      Provider.of<DbProvider>(context, listen: false)
          .addVehicle(DataBases.bikeDataBase, bike);
    }
    dialoguebox(context);
  }

  void dialoguebox(BuildContext context) {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: const Text('Added Successfully'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ));
  }
}
