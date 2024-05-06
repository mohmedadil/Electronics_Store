import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/search_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Favourite',
          style: Styles.textStyle18,
        ),
        leading: BackButton(),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'Cancel',
              style: Styles.textStyle16.copyWith(
                  color: Color(0xff0D6EFD), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              CustomSearchBar(
                issearching: true,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Shoes',
                    style: Styles.textStyle18,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
