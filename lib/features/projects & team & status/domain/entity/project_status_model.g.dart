// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectStatusAdapter extends TypeAdapter<ProjectStatus> {
  @override
  final int typeId = 0;

  @override
  ProjectStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectStatus(
      id: fields[0] as int,
      name: fields[1] as String,
      projectId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectStatus obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.projectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
