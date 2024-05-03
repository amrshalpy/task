import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utils/componant.dart';
import 'package:task/utils/style.dart';
import 'package:task/view/company_details/company_details.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              // alignment: Alignment.topCenter,
              children: [
                Stack(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 40.h, right: 10.w),
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: mainColor),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              pop(context);
                            },
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 220.h),
                    child: Container(
                      height: 500.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 110.h, left: 10.w, right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName.toString(),
                              style: TextStyle(
                                  fontSize: 27.sp,
                                  color: mainColor,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  CupertinoIcons.flame,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Wrap(
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: MediaQuery.of(context).size.width -
                                          60.w,
                                      child: Text(
                                        productDesc == null
                                            ? ' الوصف'
                                            : productDesc.toString(),
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: textColor,
                                            fontFamily: 'Tajawal',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            defaultText(
                                txt: productPrice!.toStringAsFixed(2) + ' رس ',
                                fontSize: 23.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: mainColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: defaultText(
                                        txt: '1',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.bubble_left,
                                  // color: mainColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                defaultText(
                                    txt: 'ملاحظات اضافية ؟',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                SizedBox(
                                  width: 30.w,
                                ),
                                defaultText(
                                    txt: 'اضافة ملاحظات',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 50.h,
                                      // width: 240.w,
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            defaultText(
                                                txt: 'اضافه الي السلة',
                                                color: Colors.white,
                                                fontSize: 19.sp,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt: ' 9:00 رس',
                                                color: Colors.white,
                                                fontSize: 19.sp,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            height: 50.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Icon(
                                              CupertinoIcons.cart_fill,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 17.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: Center(
                                        child: defaultText(
                                            txt: '1',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.network(productImage.toString())
          ],
        ),
      ),
    );
  }
}
