import 'package:flutter/material.dart';
import '../../Constants/size_config.dart';
import '../../Styles/colors.dart';
import '../../Widgets/addItemIcon_&_removeItemIcon.dart';
import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import '../favorite_screen/removeItemBtn.dart';
import 'shipping_details.dart';

class CartComponents extends StatelessWidget {
  const CartComponents({
    super.key,
    //  required this.onTap,
    // required this.icon,
  });
  // final GestureTapCallback onTap;
  // final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showBottomSheet(
          (context) => Container(
            height: getProportionateScreenHeight(213),
            width: getProportionateScreenWidth(double.infinity),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff111111).withOpacity(.18),
                  offset: const Offset(0, 0),
                  blurRadius: 9,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText(
                        text: "Subtotal",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                      myText(
                        text: "N18,000",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText(
                        text: "Shipping",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                      myText(
                        text: "N2000",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  const Divider(
                    thickness: .5,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText(
                        text: "Total",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w700,
                      ),
                      myText(
                        text: "N2000",
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  customButton(
                    height: 53,
                    text: "Continue to checkout",
                    tap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShippingDetails(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(
            16,
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(8),
        ),
        decoration: BoxDecoration(
          // color: Colors.brown,
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: grey,
            width: .5,
            strokeAlign: BorderSide.strokeAlignInside,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: getProportionateScreenWidth(
                      16,
                    ),
                  ),
                  height: getProportionateScreenWidth(55),
                  width: getProportionateScreenWidth(55),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Image.asset("assets/images/apple.png"),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(43),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myText(
                        text: "Farm fresh apple",
                        fontSize: getProportionateScreenWidth(
                          14,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                            text: "N1000",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                12,
                              ),
                              color: const Color(0xff353535),
                              fontWeight: FontWeight.normal,
                            ),
                            children: [
                              TextSpan(
                                text: "/Pcs",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(
                                    9,
                                  ),
                                  color: const Color(0xff353535),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(24),
                  width: getProportionateScreenWidth(74),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContainerRemoveItemIcon(
                        ontap: () {},
                      ),
                      Expanded(
                        child: myText(
                          text: "1",
                          textAlign: TextAlign.center,
                          fontSize: getProportionateScreenWidth(
                            16,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ContainerAddItemIcon(
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(
                    8,
                  ),
                ),
                RemoveItemBtn(
                  ontap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.ontap,
    required this.text,
    this.btnColor,
    this.ktextColor,
  });
  final VoidCallback ontap;
  final String text;
  final Color? btnColor;
  final Color? ktextColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: getProportionateScreenWidth(30),
        width: getProportionateScreenWidth(80),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: btnColor ?? green,
          ),
          child: Center(
            child: myText(
              text: text,
              color: ktextColor ?? white,
              fontSize: getProportionateScreenWidth(
                12,
              ),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
