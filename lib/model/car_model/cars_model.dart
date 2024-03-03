import 'package:hive/hive.dart';
part 'cars_model.g.dart';

@HiveType(typeId: 1)
class CarsModel {
  @HiveField(0)
  final String? companyName;

  @HiveField(1)
  final String modelName;

  @HiveField(2)
  final String horsePower;

  @HiveField(3)
  final int torque;

  @HiveField(4)
  final int priceDay;

  @HiveField(5)
  final int priceMonth;

  @HiveField(6)
  final dynamic image;

  CarsModel(
      {required this.companyName,
      required this.modelName,
      required this.horsePower,
      required this.torque,
      required this.priceDay,
      required this.priceMonth,
      this.image});
}