import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utils/style.dart';

nextPage(
  context,
  Widget? page,
) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
}

pop(context) {
  Navigator.pop(context);
}

nextPageUntil(
  context,
  Widget? page,
) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => page!), (route) => false);
}

Widget defualtButton({
  String? txt,
  Function()? onpress,
}) {
  return Container(
    height: 40.h,
    width: 140.w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: mainColor),
        onPressed: onpress,
        child: defaultText(
          txt: txt,
          color: Colors.white,
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        )),
  );
}

Widget defaultText({
  String? txt,
  Color color = Colors.black,
  FontWeight? fontWeight,
  double? fontSize,
}) =>
    Text(
      txt!,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.5,
        color: color,
        fontFamily: 'Tajawal',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

Widget defaultTexts({
  String? txt,
  Color color = Colors.black,
  FontWeight? fontWeight,
  double? fontSize,
}) =>
    Text(
      txt!,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.1,
        color: color,
        fontFamily: 'GE_SS_Two',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

Widget homeContainer({
  String? name,
  Widget? image,
  String? value,
}) {
  return Container(
    height: 80.h,
    width: 150.w,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 12,
            offset: Offset.fromDirection(5),
          ),
        ],

        // border: Border.all(width: .1),

        color: Colors.white,
        borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      child: Column(
        children: [
          image!,
          SizedBox(
            height: 8.h,
          ),
          defaultTexts(txt: name, fontSize: 13.sp, fontWeight: FontWeight.w600),
          SizedBox(
            height: 5.h,
          ),
          defaultTexts(
              txt: value!,
              fontSize: 15.sp,
              color: mainColor,
              fontWeight: FontWeight.w600)
        ],
      ),
    ),
  );
}

buildTextField({
  context,
  TextEditingController? controller,
  String? hint,
  String? label,
  Color color = Colors.white,
  IconData? icon,
  Function? validate,
  // Function? changed,
  IconData? suffixIcon,
  bool obscure = false,
  double width = double.infinity,
  TextInputType? type,
  Function()? press,
  Function()? ontap,
}) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    height: h * .065,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(color: Colors.black, width: .4)),
    child: Padding(
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      child: Row(
        children: [
          Icon(
            icon,
            color: mainColor,
          ),
          Flexible(
            child: TextFormField(
              validator: (value) => validate!(value),
              // onChanged: (value) => changed!(value),
              cursorColor: Colors.black,
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(
                suffix: InkWell(onTap: () => press!(), child: Icon(suffixIcon)),
                hintStyle: TextStyle(color: textColor),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 10, tw = 20, th = 10; //tw & th = triangle width & height

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, th + radius);
    path.arcToPoint(Offset(size.width - radius, th),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(radius + 10 + tw, th);
    path.lineTo(radius + 10 + tw / 2,
        0); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
    path.lineTo(radius + 10, th);
    path.lineTo(radius, th);
    path.arcToPoint(Offset(0, th + radius),
        radius: Radius.circular(radius), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}


