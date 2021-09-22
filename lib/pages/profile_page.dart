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
          SizedBox(height: 20),
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: 'My Account',
            icon: Icons.account_circle,
            press: () {},
          ),
          ProfileMenu(
            text: 'Notifications',
            icon: Icons.notification_important_rounded,
            press: () {},
          ),
          ProfileMenu(
            text: 'Settings',
            icon: Icons.settings,
            press: () {},
          ),
          ProfileMenu(
            text: 'Logout',
            icon: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    required this.text,
    required this.icon,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.blue.withAlpha(50),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/me1.png'),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset('assets/images/camera.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
