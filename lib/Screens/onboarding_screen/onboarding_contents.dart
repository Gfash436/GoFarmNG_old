import 'package:flutter/material.dart';

import '../../Constants/size_config.dart';
import '../../Widgets/myText.dart';

class onboardingContent extends StatelessWidget {
  const onboardingContent({
    Key? key,
    required this.desc,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image, title, desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            image,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(36),
        ),
        myText(
          text: title,
          textAlign: TextAlign.center,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color(0xff353535),
        ),
        SizedBox(
          height: getProportionateScreenHeight(19),
        ),
        myText(
          text: desc,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xff353535),
        ),
      ],
    );
  }
}
