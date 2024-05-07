import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/core/widgets/buttons.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/favourite/presentation/view_model/cubit/getfavourite_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/add_favourite/addfavourite_cubit.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.shoes});
  final ItemModel shoes;

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
                      child: ShoesDetails(
                        item: widget.shoes,
                      ),
                    ),
                    
                    BoxOfMoreDetails(
                      description: widget.shoes.description ?? "",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: DetailsAction(
                  shoes: widget.shoes,
                )),
          ],
        ),
      ),
    );
  }
}

class DetailsAction extends StatefulWidget {
  const DetailsAction({
    super.key,
    required this.shoes,
  });
  final ItemModel shoes;

  @override
  State<DetailsAction> createState() => _DetailsActionState();
}

class _DetailsActionState extends State<DetailsAction> {
  _DetailsActionState();
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.shoes.isFavourite;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                if (widget.shoes.isFavourite == false) {
                  widget.shoes.isFavourite = true;
                  BlocProvider.of<AddfavouriteCubit>(context)
                      .addToFavourite(widget.shoes);

                  setState(() {});
                } else {
                  isSelected = false;
                  widget.shoes.isFavourite = false;
                  setState(() {});
                  BlocProvider.of<GetfavouriteCubit>(context).getFavourite();
                  widget.shoes.delete();
                }
              },
              child: isSelected
                  ? CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'asset/images/heart.png',
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ))
                  : CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xffD9D9D9),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'asset/images/heart.png',
                          fit: BoxFit.fill,
                        ),
                      )),
            ),
            Spacer(),
          ],
        ),
        Column(
          children: [
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const ButtonActionWithIcon(
                icon: 'asset/images/bag-2.png',
                text: 'Add to Cart',
                color: Color(0xff0D6EFD),
              ),
            ),
            Spacer()
          ],
        ),
      ],
    );
  }
}

class BoxOfMoreDetails extends StatefulWidget {
  const BoxOfMoreDetails({
    super.key,
    required this.description,
  });
  final String description;
  @override
  State<BoxOfMoreDetails> createState() => _BoxOfMoreDetailsState();
}

class _BoxOfMoreDetailsState extends State<BoxOfMoreDetails> {
  bool seeMore = false;

  _BoxOfMoreDetailsState();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
              style: Styles.textStyle14,
              overflow: TextOverflow.fade,
              maxLines: seeMore ? 10 : 2,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    seeMore = true;
                    setState(() {});
                  },
                  child: seeMore
                      ? Container()
                      : Text(
                          'Read More',
                          style: Styles.textStyle14
                              .copyWith(color: const Color(0xff0D6EFD)),
                        ),
                )),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

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

class ShoesDetails extends StatelessWidget {
  const ShoesDetails({
    super.key,
    required this.item,
  });
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBar(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle20
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Brand :',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' ${item.brand}',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Color :',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' ${item.color}',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ${item.price.toString()}',
                    style: Styles.textStyle20
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Image.network(
                        item.image ?? '',
                        fit: BoxFit.fill,
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('asset/images/Slider.png')),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: Icon(Icons.arrow_back)),
        ),
        const Text(
          'Sneakers Shop',
          style: Styles.textStyle16,
        ),
        Stack(alignment: AlignmentDirectional.topEnd, children: [
          CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset('asset/images/bag-2.png')),
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 5,
            ),
          )
        ])
      ],
    );
  }
}
