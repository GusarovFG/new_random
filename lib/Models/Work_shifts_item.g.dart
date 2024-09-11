// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Work_shifts_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkShiftsItemAdapter extends TypeAdapter<WorkShiftsItem> {
  @override
  final int typeId = 1;

  @override
  WorkShiftsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkShiftsItem(
      title: fields[0] as String,
      zones: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkShiftsItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.zones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkShiftsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
