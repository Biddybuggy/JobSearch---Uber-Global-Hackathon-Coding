// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationAdapter extends TypeAdapter<Application> {
  @override
  final int typeId = 2;

  @override
  Application read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Application()
      ..userId = fields[0] as String?
      ..jobsId = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, Application obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.jobsId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
