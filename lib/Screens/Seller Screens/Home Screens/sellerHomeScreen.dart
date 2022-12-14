// import 'package:flutter/material.dart';
// import 'package:gofarmng/Constants/size_config.dart';
// import 'package:gofarmng/Screens/analytics_screen/analytics_screen.dart';
// import 'package:gofarmng/Screens/favorite_screen/favorite_screen.dart';
// import 'package:gofarmng/Screens/wallet_screen/wallet_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../bottom_navBar.dart';
// import '../home_screen_body.dart';

// class SellerHomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // final TextEditingController searchController = TextEditingController();
//   int _selectedIndex = 0;
//   // final scafoldKey = GlobalKey<ScaffoldState>();
//   static final List<Widget> _pages = [
//     HomeScreenBody(),
//     AnalyticsScreen(),
//     FavoriteScreen(),
//     const WalletScreen(),
//   ];
//   void navigatoTo(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return Scaffold(
//       // key: scafoldKey,
//       // backgroundColor: Colors.brown,
//       // backgroundColor: Colors.white,
//       // drawer: AppDrawer(),
//       body: SafeArea(child: _pages[_selectedIndex]),
//       bottomNavigationBar:
//           NavBar(navigatoTo: navigatoTo, selectedIndex: _selectedIndex),
//     );
//   }
// }