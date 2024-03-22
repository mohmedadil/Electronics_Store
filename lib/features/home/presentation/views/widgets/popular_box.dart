import 'package:flutter/material.dart';

class PopularBox extends StatelessWidget {
  const PopularBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.29,
        child: AspectRatio(
          aspectRatio: 2.9 / 3.8,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(
                              'asset/images/heart.png',
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Image.asset(
                            'asset/images/PngItem_5550642 (2) 1.png'),
                      ),
                    ],
                  ),
                  const Text(
                    'BEST SELLER',
                    style: TextStyle(fontSize: 12, color: Color(0xff0D6EFD)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Nike Jordan',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6A6A6A)),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$302.00',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A6A6A)),
                      ),
                      Container(
                        width: 34,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xff0D6EFD),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
