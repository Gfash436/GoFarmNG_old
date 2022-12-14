import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gofarmng/Styles/colors.dart';
import 'package:gofarmng/Styles/colors.dart';

import '../Constants/size_config.dart';
import 'image.dart';
import 'myText.dart';

Widget customButton(
    {VoidCallback? tap,
    bool? status = false,
    double? height = 49,
    String? text = 'Sign Up',
    bool? isValid = false,
    BuildContext? context}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false ? green : grey,
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        status == false ? text! : 'Please wait...',
        style:
            TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget customButton2(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Sign In',
    bool? isValid = false,
    BuildContext? context}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      height: 49,
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false ? white : green,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: green)),
      width: MediaQuery.of(context!).size.width,
      child: Text(
        status == false ? text! : 'Please wait...',
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget googleButton(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Sign in with Google',
    bool? isValid = false,
    BuildContext? context}) {
  return GestureDetector(
<<<<<<< HEAD
      onTap: status == true ? null : tap,
      child: Container(
          height: 49,
          margin: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: status == false ? white : green,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: grey)),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image('assets/images/googleIcon.png'),
              const SizedBox(width: 12),
              Text(
                status == false ? text! : 'Please wait...',
                style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )));
=======
    onTap: status == true ? null : tap,
    child: Container(
      height: 49,
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false ? white : green,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: grey)),
      width: MediaQuery.of(context!).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image('assets/images/googleIcon.png'),
          const SizedBox(width: 12),
          Text(
            status == false ? text! : 'Please wait...',
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
>>>>>>> 529325b0abc3888377913cb3fef5eb6c2874189b
}

Widget drawerButton(
    BuildContext context, String title, String icon, VoidCallback tap) {
<<<<<<< HEAD
  return GestureDetector(
    onTap: tap,
    child: SizedBox(
      height: getProportionateScreenHeight(40),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
=======
  return Column(
    children: [
      GestureDetector(
        onTap: tap,
        child: SizedBox(
>>>>>>> 529325b0abc3888377913cb3fef5eb6c2874189b
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: getProportionateScreenWidth(21),
                width: getProportionateScreenWidth(21),
              ),
              SizedBox(
<<<<<<< HEAD
                width: getProportionateScreenWidth(16),
              ),
              myText(
                text: title,
                color: textColor,
=======
                width: getProportionateScreenWidth(
                  16,
                ),
              ),
              myText(
                text: title,
>>>>>>> 529325b0abc3888377913cb3fef5eb6c2874189b
                fontSize: getProportionateScreenWidth(14),
              ),
            ],
          ),
        ),
      ),
<<<<<<< HEAD
    ),
=======
      Divider(
        thickness: .5,
        height: getProportionateScreenWidth(16),
      ),
    ],
>>>>>>> 529325b0abc3888377913cb3fef5eb6c2874189b
  );
}
