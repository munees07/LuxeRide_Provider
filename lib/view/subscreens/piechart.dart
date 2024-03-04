import 'package:flutter/material.dart';
import 'package:luxeride/controller/add_provider.dart';
import 'package:luxeride/model/bike_model/bikes_model.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:provider/provider.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context, listen: false);
    dbProvider.getVehicle(DataBases.carDataBase);
    dbProvider.getVehicle(DataBases.bikeDataBase);

    final List<CarsModel> cars = dbProvider.carList;
    final List<BikesModel> bikes = dbProvider.bikeList;

    double totalCarDailyPrice = 0;
    double totalBikeDailyPrice = 0;

    for (var car in cars) {
      totalCarDailyPrice += car.priceDay;
    }

    for (var bike in bikes) {
      totalBikeDailyPrice += bike.priceDay;
    }

    Map<String, double> dataMap = {
      'Cars = $totalCarDailyPrice': totalCarDailyPrice,
      'Bikes = $totalBikeDailyPrice': totalBikeDailyPrice,
    };

    List<Color> colorList = [
      Colors.black87,
      Colors.blueAccent,
    ];

    return Scaffold(
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartType: ChartType.ring,
          chartRadius: MediaQuery.of(context).size.width / 2.5,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendTextStyle: TextStyle(fontSize: 14),           
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 2,
          ),
        ),
      ),
    );
  }
}

