import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/model/bookings_model/bookings_model.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{

  void dialoguebox(BuildContext context) {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: const Text('Reset the app'),
              actions: [
                TextButton(
                    onPressed: () {
                      
                        Hive.box<BikesModel>('bikeDb').clear();
                        Hive.box<CarsModel>('carDb').clear();
                        Hive.box<BookingsModel>('bookingsDb').clear();
                      notifyListeners();
                      Navigator.pop(context);
                    },
                    child: const Text('OK',style: TextStyle(color: Colors.red),)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel',style: TextStyle(color: Colors.black)))
              ],
            ));
  }

  Future logOut() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();
    notifyListeners();
  }
}