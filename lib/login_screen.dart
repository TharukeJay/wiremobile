import 'package:flutter/material.dart';
import 'package:wireapps/home.dart';
import 'package:wireapps/signup_screen.dart';

import 'Widgets/bezier_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'W',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.lightGreen,
                          ),
                          children: [
                            TextSpan(
                              text: 'ir',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'e',
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'App',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 's',
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "email",
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "password",
                                    suffixIcon: const Icon(
                                      Icons.visibility,
                                      color: Colors.black54,
                                    ),
                                    // icon: Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(
                            context,
                          ).size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.green,
                                Colors.green,
                              ],
                            ),
                          ),
                          child: InkWell(
                            onTap: () {

                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                            ),
                            Text(
                              'or',
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      5,
                                    ),
                                    topLeft: Radius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'f',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                      5,
                                    ),
                                    topRight: Radius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Log in with Facebook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          padding: const EdgeInsets.all(
                            15,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Don\'t have an account ?',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                            left: 0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}