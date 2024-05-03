import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task/cubit/home_state.dart';
import 'package:task/model/get_branch_category.dart';
import 'package:task/model/get_branches.dart';
import 'package:task/model/get_product.dart';
import 'package:task/model/login_model.dart';
import 'package:task/services/branch_services.dart';
import 'package:task/services/home_services.dart';
import 'package:task/services/product_services.dart';
import 'package:task/utils/cache_helper.dart';
import 'package:task/utils/const.dart';
import 'package:task/utils/dio_helper.dart';
import 'package:task/view/company_details/company_details.dart';
import 'package:task/view/login/login.dart';
import 'package:uuid/uuid.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  Position? position;
  String? address;
  Geolocator? geolocator;
  double? late;
  double? longe;
  Future<void> getAddress() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position); //here you will get your Latitude and Longitude
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    late = position!.latitude;
    longe = position!.longitude;
    print(late);
    print(longe);

    ///Here

    emit(GetLocation());
  }

  LoginModel? loginModel;
  login() async {
    var formData = FormData.fromMap({
      "phone": phone,
      "password": password,
      "company_id": 3,
    });
    emit(LoginLoading());
    DioHelper.postData(path: '/api/auth/login', data: formData).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.setShared(key: kLogin, value: loginModel!.data!.accessToken);
      uid = CacheHelper.getShared(key: kLogin);

      emit(LoginSuccess(loginModel!.msg));
    }).catchError((er) {
      print(loginModel!.msg);
      emit(LoginError(loginModel!.msg));
    });
  }

  GetBranches? getBranches;
  getHomes() async {
    getBranches = await HomeServices.getBranches();

    // print(getHome!.data[0]);
    emit(GetHomeDataSuccess());
  }

  GetBranchesCategory? getBranchesCategory;
  getBranchs(id) async {
    getBranchesCategory = await BrancheServices.getBranchesDetails(id);
    categoryId = getBranchesCategory!.data[0].id.toString();
    branchName = getBranchesCategory!.data[0].title!.ar.toString();
    getProducts(id, categoryId);
    print(categoryId);
    emit(GetHomeDataSuccess());
  }

  GetProducts? getProduct;
  getProducts(branchId, categoryId) async {
    getProduct = await ProductServices.getProducts(branchId, categoryId);

    // print(getHome!.data[0]);
    emit(GetHomeDataSuccess());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ShopAppChangePasswordVisibilityState());
  }
}
