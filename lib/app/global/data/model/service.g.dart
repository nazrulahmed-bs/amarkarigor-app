// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceAdapter extends TypeAdapter<Service> {
  @override
  final int typeId = 1;

  @override
  Service read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Service(
      fields[0] as int,
      fields[1] as String,
      fields[2] as double,
      fields[3] as int,
      fields[4] as int,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String?,
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._price)
      ..writeByte(3)
      ..write(obj._catId)
      ..writeByte(4)
      ..write(obj._subCatId)
      ..writeByte(5)
      ..write(obj._icon)
      ..writeByte(6)
      ..write(obj._description)
      ..writeByte(7)
      ..write(obj._attribute)
      ..writeByte(8)
      ..write(obj._option);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
