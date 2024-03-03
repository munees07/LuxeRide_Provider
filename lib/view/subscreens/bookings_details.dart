import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingsDetails extends StatelessWidget {
  const BookingsDetails(
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
    return Scaffold(
      body: Container(
        color: const Color(0x00f3f5f7),
        child: Column(
          children: [
            const Gap(60),
            Center(
                child: Text(companyName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 29))),
            Center(
                child: Text(modelName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const Gap(40),
            Center(
                child: SizedBox(
              width: double.infinity,
              height: 210,
              child: Image(image: FileImage(File(image))),
            )),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Text('USER DETAILS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            Row(
              children: [
                const Gap(20),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Gap(20),
                  Text('User Name : $userName'),
                  const Gap(20),
                  Text('Age : $age'),
                  const Gap(20),
                  Text('Address : $address'),
                  const Gap(20),
                  Text('License NO : $license'),
                  const Gap(20),
                  Text('Package Type : $package'),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
