// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bikes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BikesModelAdapter extends TypeAdapter<BikesModel> {
  @override
  final int typeId = 2;

  @override
  BikesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BikesModel(
      companyName: fields[0] as String?,
      modelName: fields[1] as String,
      horsePower: fields[2] as String,
      torque: fields[3] as int,
      priceDay: fields[4] as int,
      priceMonth: fields[5] as int,
      image: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, BikesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.modelName)
      ..writeByte(2)
      ..write(obj.horsePower)
      ..writeByte(3)
      ..write(obj.torque)
      ..writeByte(4)
      ..write(obj.priceDay)
      ..writeByte(5)
      ..write(obj.priceMonth)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BikesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
