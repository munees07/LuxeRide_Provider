import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:luxeride/controller/add_provider.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/view/subscreens/bookings_details.dart';
import 'package:provider/provider.dart';

class Bookings extends StatelessWidget {
  const Bookings(
      {super.key,
      this.companyName,
      this.modelName,
      this.userName,
      this.age,
      this.address,
      this.license,
      this.package,
      this.image});
  final String? companyName;
  final String? modelName;
  final String? userName;
  final String? age;
  final String? address;
  final String? license;
  final String? package;
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    Provider.of<DbProvider>(context,listen: false)
        .getVehicle(DataBases.bookingsDataBase);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'LUXE-RIDE',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              'BOOKINGS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(20),
            Expanded(
              child: Consumer<DbProvider>(
                builder: (context,bookingsProvider,child) {
                  return SizedBox(
                      child: bookingsProvider.bookingsList.isEmpty
                          ? Column(
                              children: [
                                const Gap(30),
                                const Text('No bookings available'),
                                const Gap(90),
                                Lottie.asset(
                                    width: 250, 'assets/icons/noItems.json'),
                              ],
                            )
                          : ListView.builder(
                              itemCount: bookingsProvider.bookingsList.length,
                              itemBuilder: (context, index) {
                                final bookingsdata = bookingsProvider.bookingsList[index];
                                return Column(
                                  children: [
                                    Slidable(
                                      endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            const Gap(5),
                                            SlidableAction(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              backgroundColor: Colors.redAccent,
                                              onPressed: (context) {
                                                showDialog(
                                                    context: context,
                                                    useSafeArea: true,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          scrollable: true,
                                                          content: const Text(
                                                              'Are you sure?'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Provider.of<DbProvider>(context,
                                                    listen: false)
                                                .deleteVehicle(
                                                    DataBases.bookingsDataBase,
                                                    index);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                  'DELETE',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black)))
                                                          ],
                                                        ));
                                              },
                                              icon: CupertinoIcons.delete,
                                            ),
                                            const Gap(5)
                                          ]),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingsDetails(
                                                        companyName: bookingsdata
                                                            .companyName,
                                                        modelName:
                                                            bookingsdata.modelName,
                                                        userName:
                                                            bookingsdata.userName,
                                                        age: bookingsdata.age,
                                                        address:
                                                            bookingsdata.address,
                                                        license:
                                                            bookingsdata.license,
                                                        package:
                                                            bookingsdata.package,
                                                        image: bookingsdata.image,
                                                      )));
                                        },
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 150,
                                          child: Card(
                                            shadowColor: Colors.black54,
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Positioned(
                                                    right: 20,
                                                    left: 80,
                                                    child: Image(
                                                        fit: BoxFit.contain,
                                                        image: bookingsdata.image !=
                                                                null
                                                            ? FileImage(File(
                                                                bookingsdata.image))
                                                            : const AssetImage(
                                                                    'assets/images/addimage.png')
                                                                as ImageProvider)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          24, 14, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(bookingsdata.userName,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 12)),
                                                      Text(bookingsdata.package,
                                                          style: const TextStyle(
                                                              fontSize: 8))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(10)
                                  ],
                                );
                              },
                            ));
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
