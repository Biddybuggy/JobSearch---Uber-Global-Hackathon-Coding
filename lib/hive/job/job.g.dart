// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobAdapter extends TypeAdapter<Job> {
  @override
  final int typeId = 0;

  @override
  Job read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Job()
      ..jobId = fields[0] as String?
      ..name = fields[1] as String?
      ..description = fields[2] as String?
      ..companyId = fields[3] as String?
      ..salary = fields[4] as String?
      ..location = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.jobId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.companyId)
      ..writeByte(4)
      ..write(obj.salary)
      ..writeByte(5)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
