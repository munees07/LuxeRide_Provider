import 'package:hive/hive.dart';
part 'bookings_model.g.dart';

@HiveType(typeId: 3)
class BookingsModel {
  @HiveField(0)
  final String? companyName;

  @HiveField(1)
  final String modelName;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String age;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final String license;

  @HiveField(6)
  final String package;

  @HiveField(7)
  final dynamic image;

  BookingsModel(
      {required this.userName,
      required this.age,
      required this.address,
      required this.license,
      required this.package,
      required this.companyName,
      required this.modelName,
      this.image});
}