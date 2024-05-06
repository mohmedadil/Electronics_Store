// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoesModelAdapter extends TypeAdapter<ShoesModel> {
  @override
  final int typeId = 0;

  @override
  ShoesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoesModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      price: fields[2] as dynamic,
      description: fields[4] as String?,
      image: (fields[3] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShoesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
