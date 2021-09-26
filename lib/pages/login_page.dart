import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/constants.dart';
import 'package:smart_pos_mobile/data/salesperson.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/services/auth_service.dart';
import 'package:smart_pos_mobile/services/salesperson_service.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';
import 'package:smart_pos_mobile/widgets/rounded_password_input.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:smart_pos_mobile/data/user.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _error = null;
  User? userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, email: user.email);
  }

  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    var size = MediaQuery.of(context).size;
    var defaultLoginSize = size.height - (size.height * 0.2);

    Widget showAlert() {
      if (_error != null) {
        return Container(
          color: Colors.amberAccent,
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                child: Text(
                  'Invalid Email or Password',
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  },
                  icon: Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      }
      return SizedBox(
        height: 0,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            showAlert(),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: defaultLoginSize,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // SvgPicture.asset('assets/images/login.svg'),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        RoundedInput(
                          size: size,
                          icon: Icons.email,
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        RoundedPasswordInput(
                          icon: Icons.lock,
                          hintText: 'Password',
                          size: size,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final credential = await _firebaseAuth
                                    .signInWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim());
                                var user = userFromFirebase(credential.user);
                                print(user!.email);
                                var salesperson =
                                    await SalespersonService.getSalesperson(
                                        user.uid);
                                print(salesperson.firstName);
                                sModel.assignedSalesperson(salesperson);
                                // myfn(salesperson);
                                // Provider.of<SalespersonModel>(context,
                                //         listen: false)
                                //     .assignedSalesperson(salesperson);
                                print('gg');
                              } catch (e) {
                                print(e);
                                setState(() {
                                  _error = e.toString();
                                });
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'LOGIN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
