import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/controller/search_provider.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:luxeride/view/subscreens/car_editscreen.dart';
import 'package:luxeride/view/screens/vehicle_details.dart';
import 'package:provider/provider.dart';
import '../../controller/add_provider.dart';

class CarPage extends StatelessWidget {
   const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Provider.of<DbProvider>(context, listen: false)
        .getVehicle(DataBases.carDataBase);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: TextFormField(
          cursorColor: Colors.black,
          onChanged: (value) {
            
            searchProvider.carSearch = value;
            searchProvider.carSearchResult(context);
          },
          decoration: InputDecoration(
              prefixIconColor: Colors.black,
              prefixIcon: const Icon(Icons.search),
              hintText: 'search..',
              hintStyle: const TextStyle(fontSize: 12),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey))),
        ),
      ),
      body: Column(
        children: [
          const Gap(20),
          Expanded(
            child: Consumer<DbProvider>(builder: (context, value, child) {
              return SizedBox(
                  child: searchProvider.carSearch.isNotEmpty
                      ? value.filteredCar.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  const Text('No Cars Available'),
                                  const Gap(90),
                                  Lottie.asset(
                                      width: 250, 'assets/icons/noItems.json'),
                                ],
                              ),
                            )
                          : carListwidget(value.filteredCar)
                      : carListwidget(value.carList));
            }),
          )
        ],
      ),
    );
  }

  Widget carListwidget(List<CarsModel> carlist) {
    return carlist.isEmpty
        ? Center(
            child: Column(
              children: [
                const Text('No Cars Available'),
                const Gap(90),
                Lottie.asset(width: 250, 'assets/icons/noItems.json'),
              ],
            ),
          )
        : ListView.builder(
            itemCount: carlist.length,
            itemBuilder: (context, index) {
              final data = carlist[index];
              return Column(
                children: [
                  Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                          borderRadius: BorderRadius.circular(15),
                          backgroundColor: Colors.grey.shade300,
                          onPressed: (context) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CarEditScreen(
                                    index: index,
                                    companyName: data.companyName!,
                                    modelName: data.modelName,
                                    power: data.horsePower,
                                    torque: data.torque,
                                    dailyPrice: data.priceDay,
                                    monthPrice: data.priceMonth,
                                    imagepath: data.image)));
                          },
                          icon: Icons.edit),
                      const Gap(5),
                      SlidableAction(
                        borderRadius: BorderRadius.circular(15),
                        backgroundColor: Colors.redAccent,
                        onPressed: (context) {
                          showDialog(
                              context: context,
                              useSafeArea: true,
                              builder: (context) => AlertDialog(
                                    scrollable: true,
                                    content: const Text('Are you sure?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<DbProvider>(context,
                                                    listen: false)
                                                .deleteVehicle(
                                                    DataBases.carDataBase,
                                                    index);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'DELETE',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.black)))
                                    ],
                                  ));
                        },
                        icon: CupertinoIcons.delete,
                      ),
                      const Gap(5)
                    ]),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                companyName: data.companyName!,
                                modelName: data.modelName,
                                horsePower: data.horsePower,
                                torque: data.torque.toString(),
                                dailyPrice: data.priceDay.toString(),
                                monthlyPrice: data.priceMonth.toString(),
                                imagepath: data.image ?? "")));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          shadowColor: Colors.black54,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Positioned(
                                  left: 80,
                                  right: 20,
                                  child: Image(
                                      fit: BoxFit.scaleDown,
                                      image: data.image != null
                                          ? FileImage(File(data.image!))
                                          : const AssetImage(
                                                  'assets/images/addimage.png')
                                              as ImageProvider)),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 14, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        data.companyName!),
                                    Text(
                                        style: const TextStyle(fontSize: 8),
                                        data.modelName)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(19)
                ],
              );
            },
          );
  }
}
