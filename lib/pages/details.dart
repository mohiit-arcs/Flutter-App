import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
          Image.asset(
            'images/salad2.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mediterranean',
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                  Text(
                    'Chickpeas Salad',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (counter == 0) return;
                  setState(() {
                    counter--;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7)),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                counter.toString(),
                style: AppWidget.semiBoldTextFieldStyle(),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  if (counter == 10) return;
                  setState(() {
                    counter++;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: AppWidget.lightTextFieldStyle(),
            maxLines: 4,
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Text(
                'Delivery Time',
                style: AppWidget.semiBoldTextFieldStyle(),
              ),
              const SizedBox(
                width: 25.0,
              ),
              const Icon(
                Icons.alarm,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                '30 min',
                style: AppWidget.semiBoldTextFieldStyle(),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    Text(
                      '₹100',
                      style: AppWidget.headlineTextFieldStyle(),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0)),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ]),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
