import 'package:flutter/material.dart';
import 'package:Electronic_Store/features/favourite/presentation/views/favourite_view.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/profile.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/cart_view.dart';

const kBackgroundColor = Color(0xffF7F7F9);
const kfont = 'Raleway';
List<String> category = [
  'All',
  'tv',
  'audio',
  'laptop',
  'mobile',
  "gaming",
  "appliances",
];

List<Widget> page = [
  HomeViewBody(),
  const FavouriteView(),
  const CartView(),
  const AccountProfile(),
];
