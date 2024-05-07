import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';

class PopularBox extends StatelessWidget {
  PopularBox({
    super.key,
    this.shoes,
  });
  ItemModel? shoes;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28 * 0.6,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Image.network(
                          'https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691056487173-headphon2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            'asset/images/heart.png',
                          )),
                    ),
                  ],
                ),
                const Text(
                  'BEST SELLER',
                  style: TextStyle(fontSize: 12, color: Color(0xff0D6EFD)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  shoes?.title ?? 'No title',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6A6A6A)),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${shoes?.price}',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A6A6A)),
                      ),
                      Container(
                        width: 34.w,
                        height: 35.h,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
