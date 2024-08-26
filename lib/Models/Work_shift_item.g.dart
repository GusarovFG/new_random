// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Work_shift_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkShiftItemAdapter extends TypeAdapter<WorkShiftItem> {
  @override
  final int typeId = 1;

  @override
  WorkShiftItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkShiftItem(
      workShifts: (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkShiftItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.workShifts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkShiftItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
