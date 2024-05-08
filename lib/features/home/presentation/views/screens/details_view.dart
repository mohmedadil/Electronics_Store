import 'package:Electronic_Store/features/home/presentation/views/widgets/box_of_more_details.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/details_action.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.item});
  final ItemModel item;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ItemDetails(
                        item: widget.item,
                      ),
                    ),
                    BoxOfMoreDetails(
                      description: widget.item.description ?? "",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: DetailsAction(
                  item: widget.item,
                )),
          ],
        ),
      ),
    );
  }
}
