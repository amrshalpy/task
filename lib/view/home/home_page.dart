import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/cubit/home_cubit.dart';
import 'package:task/cubit/home_state.dart';
import 'package:task/utils/componant.dart';
import 'package:task/utils/const.dart';
import 'package:task/utils/style.dart';
import 'package:task/view/company_details/company_details.dart';
import 'package:task/view/loading/loading.dart';
import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String? title;
String? id;
String? phone;
String? image;
String? address;
String? distance;
String? open;
String? close;

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> controller = Completer();

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Set<Marker> markers = {};
  bool isRecieve = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getHomes(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        // print('data======${cubit.getHome?.data}');
        cubit.getBranches?.data!.forEach((element) async {
          markers.add(Marker(
            onTap: () {},
            visible: true,
            zIndex: 2,
            icon: BitmapDescriptor.defaultMarkerWithHue(40),
            markerId: MarkerId(element.id.toString()),
            position:
                LatLng(double.parse(element.lat!), double.parse(element.long!)),
            infoWindow: InfoWindow(
                title: element.title!.ar,
                onTap: () {
                  setState(() {
                    isRecieve = true;
                    title = element.title!.ar.toString();
                    id = element.id.toString();
                    image = element.image.toString();
                    distance = element.distance.toStringAsFixed(1);
                    open = element.statusAr.toString();
                    close = element.eveningTimeTo.toString();
                    address = element.address!.ar.toString();
                    phone = element.phone.toString();
                  });
                }),
          ));
        });

        return cubit.getBranches != null && cubit.getBranches!.data!.isNotEmpty
            ? Scaffold(
                body: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height,
                            child: GoogleMap(
                              markers: markers,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      double.parse(
                                          cubit.getBranches!.data![0].lat!),
                                      double.parse(
                                          cubit.getBranches!.data![0].long!)),
                                  bearing: 0,
                                  tilt: 10,
                                  zoom: 4),
                              mapType: MapType.normal,
                              onMapCreated: (_controller) {
                                controller.complete(_controller);
                              },
                              zoomControlsEnabled: false,
                            )),
                        if (isRecieve == true)
                          InkWell(
                            onTap: () {
                              nextPage(
                                  context,
                                  CompanyDetails(
                                    id: id,
                                  ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 50.h, left: 10.w, right: 10.w),
                              child: AnimatedContainer(
                                padding: EdgeInsets.all(10),
                                height: 270.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey.shade200,
                                        spreadRadius: 3)
                                  ],
                                  color: Colors.white,
                                ),
                                duration: Duration(seconds: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            defaultText(
                                                txt: title,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                            Row(
                                              children: [
                                                defaultText(
                                                    txt: phone,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                defaultText(
                                                    txt: ' : رقم المحمول ',
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: 50.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      image.toString()))),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 40.h,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              78.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              defaultText(
                                                  txt: 'عنوان الفرع ',
                                                  fontSize: 15.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              Text(
                                                address.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  // color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Tajawal',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Icon(
                                          Icons.location_searching_rounded,
                                          color: textColor,
                                          size: 28,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            defaultText(
                                                txt: 'الوصول الي الفرع',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal),
                                            Row(
                                              children: [
                                                defaultText(
                                                    txt: 'كم',
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                defaultText(
                                                    txt: distance,
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: textColor,
                                          size: 28,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        defaultText(
                                          txt: close != 'null'
                                              ? '   ${close}  '
                                              : '   04:00:00  ',
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 1.w,
                                          color: textColor,
                                        ),
                                        defaultText(
                                          txt: ' يغلق',
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: 35.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: mainColor),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Center(
                                            child: defaultText(
                                              txt: '  مفتوح  ',
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            : Material(child: Loading());
      }),
    );
  }
}
