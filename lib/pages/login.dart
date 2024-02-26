import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddeliveryapp/pages/bottomNav.dart';
import 'package:fooddeliveryapp/pages/forgotPassword.dart';
import 'package:fooddeliveryapp/pages/signup.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  logIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          closeIconColor: Colors.black54,
          showCloseIcon: true,
          backgroundColor: Colors.green,
          content: Column(
            children: [
              Text(
                'LoggedIn Successfully',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 1.0,
              )
            ],
          )));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            closeIconColor: Colors.black54,
            showCloseIcon: true,
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'User Not Found!',
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            closeIconColor: Colors.black54,
            showCloseIcon: true,
            backgroundColor: Colors.redAccent,
            content: Text(
              'Invalid Credentials!',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFff5c30), Color(0xFFe74b1a)])),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Text(""),
        ),
        Container(
          margin: EdgeInsets.only(top: 60.0, right: 20.0, left: 20.0),
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                "images/logo.png",
                width: MediaQuery.of(context).size.width / 1.5,
                fit: BoxFit.cover,
              )),
              SizedBox(
                height: 50.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'LogIn',
                        style: AppWidget.headlineTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null) {
                            return "Enter your email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: AppWidget.semiBoldTextFieldStyle(),
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null) {
                            return "Enter your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: AppWidget.semiBoldTextFieldStyle(),
                            prefixIcon: Icon(Icons.password_outlined)),
                        obscureText: true,
                        obscuringCharacter: "*",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Password?',
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text.toString();
                              password = passwordController.text.toString();
                            });
                            logIn();
                          }
                        },
                        child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0Xffff5722),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                  child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'Poppins1',
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
