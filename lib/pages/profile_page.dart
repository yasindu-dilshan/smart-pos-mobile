import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profilePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me1.png'),
                ),
                SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: SvgPicture.asset('assets/images/camera.svg'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
