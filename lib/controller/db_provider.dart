import 'package:flutter/material.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/model/bookings_model/bookings_model.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:luxeride/services/functions/crud_functions.dart';

import 'add_provider.dart';

class DbProvider extends ChangeNotifier {
  final VehicleDb _vehicleservice = VehicleDb();
  List<CarsModel> carList = [];
  List<CarsModel> filteredCar = [];
  List<BikesModel> bikeList = [];
  List<BikesModel> filteredBike = [];
  List<BookingsModel> bookingsList = [];

  Future<void> addVehicle(DataBases database, dynamic vehicle) async {
    _vehicleservice.adding(database, vehicle);

    await getVehicle(database);
    notifyListeners();
  }

  Future<void> getVehicle(DataBases database) async {
    carList = await _vehicleservice.getAllList(DataBases.carDataBase);
    bikeList = await _vehicleservice.getAllList(DataBases.bikeDataBase);
    bookingsList = await _vehicleservice.getAllList(DataBases.bookingsDataBase);
    notifyListeners();
  }

  Future<void> deleteVehicle(DataBases dataBases, int index) async {
    await _vehicleservice.delete(dataBases, index);
    getVehicle(dataBases);
  }

  Future<void> editVehicle(DataBases dataBases, value, index) async {
    await _vehicleservice.edit(dataBases, index, value);
    notifyListeners();
    getVehicle(dataBases);
  }

  void filteredCarSearch(List<CarsModel> value) async {
    filteredCar = value;
    notifyListeners();
  }

  void filteredBikeSearch(List<BikesModel> value) async {
    filteredBike = value;
    notifyListeners();
  }
}
