import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pos_mobile/constants.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';
import 'package:smart_pos_mobile/widgets/rounded_password_input.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/loginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SvgPicture.asset("assets/images/login.svg"),
                    SizedBox(
                      height: 40,
                    ),
                    RoundedInput(
                        size: size, icon: Icons.email, hintText: "Email"),
                    RoundedPasswordInput(
                        icon: Icons.lock, hintText: "Password", size: size),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(HomePage.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: size.width * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
