import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/view/subscreens/bikes.dart';
import 'package:luxeride/view/subscreens/cars.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 13, 70, 0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TabBar(
                    splashBorderRadius: BorderRadius.circular(40),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    tabs: const [Tab(text: 'CARS'), Tab(text: 'BIKES')]),
              ),
            ),
            const Gap(20),
            const Expanded(child: TabBarView(children: [CarPage(), BikePage()]))
          ],
        ),
      ),
    );
  }
}
