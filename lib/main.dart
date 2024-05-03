import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/home_cubit.dart';
import 'package:task/utils/cache_helper.dart';
import 'package:task/utils/const.dart';
import 'package:task/utils/dio_helper.dart';
import 'package:task/view/home/home_page.dart';
import 'package:task/view/login/login.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  uid = CacheHelper.getShared(key: kLogin) != null
      ? CacheHelper.getShared(key: kLogin)
      : null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit()..getHomes())],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ElOrder',
              home: uid != null ? HomePage() : Login(),
            );
          }),
    );
  }
}
