import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/view/subscreens/user_details.dart';
import 'package:luxeride/view/widgets/global_widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key,
      required this.companyName,
      required this.modelName,
      this.horsePower,
      this.torque,
      this.dailyPrice,
      this.monthlyPrice,
      this.imagepath});

  final String companyName;
  final String modelName;
  final String? horsePower;
  final String? torque;
  final String? dailyPrice;
  final String? monthlyPrice;
  final String? imagepath;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File? selectedimage;
  String? companyName;
  String? modelName;

  @override
  void initState() {
    selectedimage = widget.imagepath != '' ? File(widget.imagepath!) : null;
    companyName = widget.companyName;
    modelName = widget.modelName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color(0x00f3f5f7),
        child: Column(
          children: [
            const Gap(60),
            Center(
                child: Text(widget.companyName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 29))),
            Center(
                child: Text(widget.modelName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const Gap(40),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 210,
                child: Image(image: FileImage(File(widget.imagepath!))),
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Text('DETAILS',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Text('Company Name : ${widget.companyName}'),
                    const Gap(20),
                    Text('Model Name : ${widget.modelName}'),
                    const Gap(20),
                    Text('Horse Power : ${widget.horsePower}'),
                    const Gap(20),
                    Text('Torque : ${widget.torque}'),
                    const Gap(20),
                    Text('Price for a Day : ${widget.dailyPrice}\$'),
                    const Gap(20),
                    Text('Price for a Month : ${widget.monthlyPrice}\$')
                  ],
                ),
              ],
            ),
            const Gap(54),
            FilledButtonWidget(
                onPressedButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(
                            imagepath: selectedimage!.path,
                            companyname: widget.companyName,
                            modelname: widget.modelName,
                          )));
                },
                buttontext: 'RENT NOW')
          ],
        ),
      ),
    ));
  }
}
