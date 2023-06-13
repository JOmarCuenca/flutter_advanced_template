// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExampleObjAdapter extends TypeAdapter<ExampleObj> {
  @override
  final int typeId = 0;

  @override
  ExampleObj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExampleObj(
      name: fields[3] as String,
      createdAt: fields[0] as DateTime,
      modifiedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExampleObj obj) {
    writer
      ..writeByte(3)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.modifiedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
