import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/home_cubit.dart';
import 'package:task/cubit/home_state.dart';
import 'package:task/utils/componant.dart';
import 'package:task/utils/style.dart';
import 'package:task/view/home/home_page.dart';
import 'package:task/view/loading/loading.dart';
import 'package:task/view/product_details/product_details.dart';

class CompanyDetails extends StatefulWidget {
  String? id;
  CompanyDetails({super.key, this.id});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

String? categoryId;
String? productImage;
String? productName;
String? productDesc;
int? productPrice;
 String? branchName;
class _CompanyDetailsState extends State<CompanyDetails> {
 
  int branchIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()
        ..getBranchs(widget.id)
        ..getProducts(widget.id, categoryId),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return cubit.getBranchesCategory != null && cubit.getProduct != null
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: Colors.grey.shade100,
                  body: Padding(
                    padding:
                        EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            defaultText(
                                txt: branchName == null
                                    ? 'Branch Details'
                                    : branchName,
                                fontSize: 23.sp,
                                color: mainColor,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        cubit.getBranchesCategory!.data.isNotEmpty
                            ? Container(
                                height: 80,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            setState(() {
                                              categoryId = cubit
                                                  .getBranchesCategory!
                                                  .data[index]
                                                  .id
                                                  .toString();
                                              branchName = cubit
                                                  .getBranchesCategory!
                                                  .data[index]
                                                  .title
                                                  !.ar
                                                  .toString();
                                              branchIndex = index;
                                            });
                                            cubit.getProducts(
                                                widget.id, categoryId);
                                            print(categoryId);
                                          },
                                          child: Container(
                                            height: 80.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                color: branchIndex == index
                                                    ? mainColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 3,
                                                      color:
                                                          Colors.grey.shade300,
                                                      spreadRadius: 3)
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(cubit
                                                        .getBranchesCategory!
                                                        .data[index]
                                                        .image
                                                        .toString()))),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 10,
                                        ),
                                    itemCount:
                                        cubit.getBranchesCategory!.data.length),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: mainColor,
                                strokeWidth: 3,
                              )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: cubit.getProduct!.data.data!.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.39,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      nextPage(context, ProductDetails());
                                      productName = cubit.getProduct!.data
                                          .data![index].itemName;
                                      productDesc = cubit.getProduct!.data
                                          .data![index].description!.ar;
                                      productImage = cubit.getProduct!.data
                                          .data![index].lastImage!.image;
                                      productPrice = cubit
                                          .getProduct!.data.data![index].price;
                                    },
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: 240.h,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                height: 140.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color: Colors
                                                            .grey.shade200,
                                                        spreadRadius: 3,
                                                      )
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30.h),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        cubit
                                                            .getProduct!
                                                            .data
                                                            .data![index]
                                                          .itemName??'',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: mainColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Tajawal',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        cubit
                                                            .getProduct!
                                                            .data
                                                            .data![index]
                                                            .description
                                                            !.ar??'',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Tajawal',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          defaultText(
                                                              txt: cubit
                                                                      .getProduct!
                                                                      .data
                                                                      .data![
                                                                          index]
                                                                      .price
                                                                      !.toStringAsFixed(
                                                                          2) +
                                                                  ' رس ',
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          Icon(Icons
                                                              .favorite_border)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.network(
                                          cubit.getProduct!.data.data![index]
                                              .lastImage!.image,
                                          height: 110.h,
                                        )
                                      ],
                                    ),
                                  ),
                                  itemCount:
                                      cubit.getProduct!.data.data!.length,
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    // color: mainColor,
                                    strokeWidth: 3,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Material(child: Loading());
      }),
    );
  }
}
