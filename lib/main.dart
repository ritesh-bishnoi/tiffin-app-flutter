// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'widgets/addNewUser.dart';
import 'widgets/addUsers.dart';
import 'widgets/bills.dart';
import 'widgets/home-page.dart';
import 'widgets/drawer-Options.dart';
import 'widgets/profile-details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TiffinApp());
}

class TiffinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiffin Management',
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/profile': (context) => ProfileDetails(),
        '/bills': (context) => Bills(),
        '/addUsers': (context) => AddRemoveUsers(),
        '/newUser': (context) => AddNewUser(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'OpenSans',

        //primarySwatch: Color(),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: themeLightColor),
          backgroundColor: themePrimaryColor,
          titleTextStyle: appBarTextStyle,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _TiffinAppState();
}

class _TiffinAppState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: themeColor,
        child: Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            title: Text(
              "Home",
            ),
          ),
          endDrawer: Drawer(
            elevation: 5,
            backgroundColor: themePrimaryColor,
            child: DrawerOptions(),
          ),
          body: SingleChildScrollView(
            child: HomePageContent(),
          ),
        ),
      ),
    );
  }
}
