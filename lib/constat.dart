import 'package:flutter/material.dart';
import 'package:shoes_store/features/home/presentation/views/favourite_view.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:shoes_store/features/home/presentation/views/cart_view.dart';

const kBackgroundColor = Color(0xffF7F7F9);
const kfont = 'Raleway';
List<String> category = [
  'All Shoes',
  'Outdoor',
  'Tennis',
  'Athletic shoes',
  'Boat shoes'
];

List<Widget> page = [
  const HomeViewBody(),
  const FavouriteView(),
  const CartView(),
];
