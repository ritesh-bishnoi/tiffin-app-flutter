// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '../shared/constants.dart';

class DrawerOptions extends StatefulWidget {
  const DrawerOptions({super.key});

  @override
  State<DrawerOptions> createState() => _DrawerOptionsState();
}

class _DrawerOptionsState extends State<DrawerOptions> {
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.only(top: 120.0, left: 50.0),
      curve: Curves.decelerate,
      decoration: BoxDecoration(
        color: themeLightColor,
      ),
      child: Text(
        'Hey There!',
        style: TextStyle(
          color: themeTextIconColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildDrawerHeader(),
        ListTile(
          title: Text(
            "Home",
            style: textStyle,
          ),
          onTap: () => Navigator.pushNamed(context, '/home'),
        ),
        ListTile(
          title: Text(
            bills,
            style: textStyle,
          ),
          onTap: () => Navigator.pushNamed(context, '/bills'),
        ),
        ListTile(
          title: Text(
            drawerText,
            style: textStyle,
          ),
          onTap: () => Navigator.pushNamed(context, '/addUsers'),
        ),
        ListTile(
          title: Text(
            "Milk Manager(Soon)",
            style: textStyle,
          ),
          onTap: () => {},
        ),
        ListTile(
          title: Text(
            "Logout",
            style: textStyle,
          ),
          onTap: () => {},
        ),
      ],
    );
  }
}
