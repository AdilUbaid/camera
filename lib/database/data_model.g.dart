// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CameraDataAdapter extends TypeAdapter<CameraData> {
  @override
  final int typeId = 1;

  @override
  CameraData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CameraData(
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CameraData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CameraDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
