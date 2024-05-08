// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 0;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[3] as dynamic,
      description: fields[5] as String?,
      image: fields[4] as String?,
      brand: fields[6] as String?,
      category: fields[2] as String?,
      color: fields[7] as String?,
    )
      ..isFavourite = fields[8] as bool
      ..cart = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.brand)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.isFavourite)
      ..writeByte(9)
      ..write(obj.cart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
