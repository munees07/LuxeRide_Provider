import 'package:hive_flutter/hive_flutter.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/model/bookings_model/bookings_model.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import '../../controller/add_provider.dart';

class VehicleDb {

  Future<void> adding(DataBases dataBase, value) async {
    final box = await openAllBox(dataBase);
    await box.add(value);
    await getAllList(dataBase);
  }

  Future<Box<dynamic>> openAllBox(DataBases dataBase) async {
    switch (dataBase) {
      case DataBases.carDataBase:
        return await Hive.openBox<CarsModel>('carDb');
      case DataBases.bikeDataBase:
        return await Hive.openBox<BikesModel>('bikeDb');
      case DataBases.bookingsDataBase:
        return await Hive.openBox<BookingsModel>('bookingsDb');
    }
  }

  Future getAllList(DataBases dataBase) async {
    final box = await openAllBox(dataBase);
    return box.values.toList();

  }

  Future<void> delete(DataBases dataBase, int index) async {
    final box = await openAllBox(dataBase);
    await box.deleteAt(index);
    await getAllList(dataBase);
  }

  Future<void> edit(DataBases dataBase, int index, dynamic value) async {
    final box = await openAllBox(dataBase);

    box.putAt(index, value);
    await getAllList(dataBase);
  }
}
