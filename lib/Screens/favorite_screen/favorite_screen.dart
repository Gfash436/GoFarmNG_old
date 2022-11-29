import 'package:flutter/material.dart';
import 'package:gofarmng/Constants/size_config.dart';

import '../../Widgets/search_textformfield.dart';
import '../analytics_screen/analytics_screen.dart';
import '../home_screen/app_bar.dart';
import '../home_screen/app_drawer.dart';
import 'fovorite_components.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      appBar: appBar(context, scafoldKey),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
        ),
        child: Column(
          children: [
            const SearchTextFormField(),
            SizedBox(
              height: getProportionateScreenHeight(
                16,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...List.generate(
                        15,
                        (index) => const FavComponents(),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
