import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/core/widgets/buttons.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.89,
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ShoesDetails(),
                  ),
                  DetailsListView(),
                  BoxOfMoreDetails()
                ],
              ),
            ),
            DetailsAction(),
          ],
        ),
      ),
    );
  }
}

class DetailsAction extends StatelessWidget {
  const DetailsAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xffD9D9D9),
            child: Container(
              width: 20,
              height: 20,
              child: Image.asset(
                'asset/images/heart.png',
                fit: BoxFit.fill,
              ),
            )),
        Container(
          width: 208,
          child: ButtonActionWithIcon(
            icon: 'asset/images/bag-2.png',
            text: 'Add to Cart',
            color: Color(0xff0D6EFD),
          ),
        ),
      ],
    );
  }
}

class BoxOfMoreDetails extends StatelessWidget {
  const BoxOfMoreDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike........',
              style: Styles.textStyle14,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Read More',
                  style: Styles.textStyle14.copyWith(color: Color(0xff0D6EFD)),
                )),
            SizedBox(
              height: 60,
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
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 74,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 73,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22)),
                child: Image.asset(
                  'asset/images/PngItem_5550642 (2) 1.png',
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nike Air Max 270 Essential',
                    style: Styles.textStyle20
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Men’s Shoes',
                    style: Styles.textStyle16.copyWith(
                        color: Color(0xff707B81), fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$179.39',
                    style: Styles.textStyle20
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
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
                      child: Image.asset(
                        'asset/images/Aire Jordan Nike.png',
                        fit: BoxFit.fill,
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('asset/images/Slider.png')),
              ],
            ),
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
