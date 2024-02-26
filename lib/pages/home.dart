import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/details.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 50.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello, Mohit,',
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Delicious Food',
              style: AppWidget.headlineTextFieldStyle(),
            ),
            Text(
              'Discover and Get Great Food',
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/salad2.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Veggie Taco Hash',
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Fresh and Healthy',
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              Text(
                                '₹100',
                                style: AppWidget.semiBoldTextFieldStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/salad2.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Mixed Veg Salad',
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Spicy with Onion',
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              Text(
                                '₹120',
                                style: AppWidget.semiBoldTextFieldStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/salad2.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Mediterranean Chicpeas Salad',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Honey Goot Cheese',
                                  style: AppWidget.lightTextFieldStyle(),
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  '₹70',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )),
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'images/ice-cream.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'images/pizza.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'images/salad.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
