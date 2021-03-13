import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
              buildMenuItem('Sign In / Sign Out', CupertinoIcons.person,
                  Color(0xFFE39519)),
              Divider(
                thickness: 1,
              ),
              buildMenuItem('Home', CupertinoIcons.home, Colors.red),
              buildMenuItem('About Grigora',
                  CupertinoIcons.exclamationmark_circle, Colors.black),
              buildMenuItem('Help & Support', CupertinoIcons.question_circle,
                  Colors.black),
              buildMenuItem(
                  'Partner with us', CupertinoIcons.briefcase, Colors.black),
              Divider(
                thickness: 1,
              ),
              buildBottomOfDrawer('+2347013024711', CupertinoIcons.phone),
              buildBottomOfDrawer('hello@grigora.ng', CupertinoIcons.mail),
            ],
          )
        ],
      ),
    ),
  );
}

buildMenuItem(String text, IconData icon, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 30.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
        ),
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

buildBottomOfDrawer(String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 30.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
        ),
        Icon(
          icon,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
