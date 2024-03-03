// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingsModelAdapter extends TypeAdapter<BookingsModel> {
  @override
  final int typeId = 3;

  @override
  BookingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingsModel(
      userName: fields[2] as String,
      age: fields[3] as String,
      address: fields[4] as String,
      license: fields[5] as String,
      package: fields[6] as String,
      companyName: fields[0] as String?,
      modelName: fields[1] as String,
      image: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, BookingsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.modelName)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.license)
      ..writeByte(6)
      ..write(obj.package)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
