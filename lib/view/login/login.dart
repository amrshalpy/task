import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/home_cubit.dart';
import 'package:task/cubit/home_state.dart';
import 'package:task/utils/cache_helper.dart';
import 'package:task/utils/componant.dart';
import 'package:task/utils/const.dart';
import 'package:task/utils/style.dart';
import 'package:task/view/home/home_page.dart';
import 'package:task/view/loading/loading.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

String? phone;
String? password;

class _LoginState extends State<Login> {
  String mobileError = '';

  String PasswordError = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 190.h,
            width: double.infinity,
            color: mainColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 60.h, right: 20.w),
                  child: defaultText(
                      txt: 'تسجيل الدخول',
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: Container(
                height: 600.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.only(top: 80.h, right: 20.w, left: 20.w),
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {
                      if (state is LoginSuccess) {
                          nextPageUntil(context, HomePage());
                       
                      } else if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error.toString())));
                      }
                    }, builder: (context, state) {
                      HomeCubit cubit = HomeCubit.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: defaultText(
                                txt: 'لنقم بتسجيل الدخول',
                                color: Colors.black,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                defaultText(
                                    txt: 'رقم الجوال',
                                    color: textColor,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 55,
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.black),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        setState(() {
                                          mobileError = 'ادخل رقم الموبايل';
                                        });
                                        return mobileError;
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      if (value.length >= 10) {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                      }
                                      setState(() {
                                        phone = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      errorText: mobileError.toString(),
                                      hintText: '05########',
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade400,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                defaultText(
                                    txt: 'كلمة المرور',
                                    color: textColor,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 55,
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        setState(() {
                                          PasswordError = 'ادخل كلمه السر';
                                        });
                                        return PasswordError;
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    obscureText: cubit.isPassword,
                                    decoration: InputDecoration(
                                        errorText: PasswordError.toString(),
                                        border: InputBorder.none,
                                        prefixIcon: InkWell(
                                            onTap: () {
                                              cubit.changePasswordVisibility();
                                            },
                                            child: Icon(
                                              cubit.suffix,
                                              color: Colors.grey.shade400,
                                            ))),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade400,
                                  thickness: 1,
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: defaultText(
                                txt: ' نسيت كلمة المرور ',
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Center(
                              child: defualtButton(
                                  txt: 'تسجيل الدخول',
                                  onpress: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.login();
                                    }
                                  })),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              defaultText(
                                  txt: ' حساب جديد ',
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                              defaultText(
                                  txt: ' ليس لديك حساب ',
                                  color: textColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ],
                          )
                        ],
                      );
                    }),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
