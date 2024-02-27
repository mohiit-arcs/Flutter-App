import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/bottomNav.dart';
import 'package:fooddeliveryapp/pages/forgotPassword.dart';
import 'package:fooddeliveryapp/pages/login.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "", email = "", password = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registeration() async {
    if (password.trim() != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            closeIconColor: Colors.black54,
            showCloseIcon: true,
            backgroundColor: Colors.redAccent,
            content: Column(
              children: [
                Text(
                  'Registered Successfully',
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
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              closeIconColor: Colors.black54,
              showCloseIcon: true,
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Password is too weak',
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              closeIconColor: Colors.black54,
              showCloseIcon: true,
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account Already Exists',
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

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
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Text(""),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0, right: 20.0, left: 20.0),
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  "images/logo.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.cover,
                )),
                const SizedBox(
                  height: 50.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    height: MediaQuery.of(context).size.height / 1.65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Sign Up',
                          style: AppWidget.headlineTextFieldStyle(),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: const Icon(Icons.person_outline)),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: const Icon(Icons.email_outlined)),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: const Icon(Icons.password_outlined)),
                          obscureText: true,
                          obscuringCharacter: "*",
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forgot Password?',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text.toString();
                                email = emailController.text.toString();
                                password = passwordController.text.toString();
                              });
                            }
                            registeration();
                          },
                          child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                width: 200,
                                decoration: BoxDecoration(
                                    color: const Color(0Xffff5722),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                    child: Text(
                                  "SIGN UP",
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
                const SizedBox(
                  height: 70.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ));
                  },
                  child: Text(
                    "Already have an account? Log In",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
