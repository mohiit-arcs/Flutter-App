import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home.dart';
import 'package:fooddeliveryapp/pages/order.dart';
import 'package:fooddeliveryapp/pages/profile.dart';
import 'package:fooddeliveryapp/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Wallet walletPage;
  late Order orderPage;
  late Profile profilePage;

  @override
  void initState() {
    super.initState();

    homepage = Home();
    walletPage = Wallet();
    orderPage = Order();
    profilePage = Profile();
    pages = [homepage, orderPage, walletPage, profilePage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            CurvedNavigationBarItem(
                child: Icon(
              Icons.home_outlined,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.person_outlined,
              color: Colors.white,
            )),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
