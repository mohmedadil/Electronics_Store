import 'package:flutter/material.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({
    super.key,
    required this.images,
  });
  final List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 74,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 73,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22)),
                child: Image.network(
                  images[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
