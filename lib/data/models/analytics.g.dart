// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyticsAdapter extends TypeAdapter<Analytics> {
  @override
  final int typeId = 2;

  @override
  Analytics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Analytics(
      totalIncome: fields[0] as double,
      totalExpense: fields[1] as double,
      category: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Analytics obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.totalIncome)
      ..writeByte(1)
      ..write(obj.totalExpense)
      ..writeByte(2)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
