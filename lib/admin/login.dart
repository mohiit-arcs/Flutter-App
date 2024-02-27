import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/admin/admin_home.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFededeb),
        body: Container(
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2),
                  padding:
                      const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 53, 51, 51),
                            Colors.black
                          ]),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                              MediaQuery.of(context).size.width, 110.0)))),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        "Let's start with\nAdmin!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 5.0, bottom: 5.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 160, 160, 147)),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: TextFormField(
                                    controller: userNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter UserName";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 160, 160, 147))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 5.0, bottom: 5.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 160, 160, 147)),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: userPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter UserName";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 160, 160, 147))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  loginAdmin();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "LogIn",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() async {
    try {
      FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
        snapshot.docs.forEach((result) {
          if (result.data()['id'] != userNameController.text.trim()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                closeIconColor: Colors.black54,
                showCloseIcon: true,
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  'Your Id is incorrect',
                  style: TextStyle(fontSize: 18.0),
                )));
          } else if (result.data()['password'] !=
              userPasswordController.text.trim()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                closeIconColor: Colors.black54,
                showCloseIcon: true,
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  'Your Password is incorrect',
                  style: TextStyle(fontSize: 18.0),
                )));
          } else {
            Route route = MaterialPageRoute(
              builder: (context) => AdminHome(),
            );
            Navigator.pushReplacement(context, route);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                closeIconColor: Colors.black,
                showCloseIcon: true,
                backgroundColor: Colors.white70,
                content: Column(
                  children: [
                    Text(
                      'Admin LoggedIn Successfully',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.0,
                    )
                  ],
                )));
          }
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          closeIconColor: Colors.black,
          showCloseIcon: true,
          backgroundColor: Colors.white70,
          content: Column(
            children: [
              Text(
                'Something went wrong',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.0,
              )
            ],
          )));
    }
  }
}
