import 'package:flutter/material.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  String carSearch = "";
  String bikeSearch = "";

  void carSearchResult(BuildContext context) {
    final dbprovider = Provider.of<DbProvider>(context, listen: false);
    final filteredList = dbprovider.carList
        .where((car) =>
            car.companyName!.toLowerCase().contains(carSearch.toLowerCase()))
        .toList();
    dbprovider.filteredCarSearch(filteredList);
  }

  void bikeSearchResult(BuildContext context) {
    final dbprovider = Provider.of<DbProvider>(context, listen: false);
    final filteredBikeList = dbprovider.bikeList
        .where((bike) =>
            bike.companyName!.toLowerCase().contains(bikeSearch.toLowerCase()))
        .toList();
    dbprovider.filteredBikeSearch(filteredBikeList);
  }
}
