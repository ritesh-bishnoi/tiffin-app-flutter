// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String drawerText = "Add/Remove Users";
String addUser = "Add User";
String bills = "Bills";
String dropDownValue = "All";

DateTime selectedDate = DateTime.now();

//Color themeColor = Color(0xffFF724C);
Color themeColor = Color(0xffE9E1B6);
Color themeTextIconColor = Color(0xff2A2C41);
Color dropDownColor = Color(0xffFDBF50);
Color themePrimaryColor = Color(0xff9747FF);
Color themeLightColor = Color(0xffF4F4F8);

int countBreakfast = 0;
int countLunch = 0;
int countDinner = 0;
int breakfastCost = 50;
int lunchCost = 100;
int dinnerCost = 150;
int tempBreakfastCost = 0;
int tempLunchCost = 0;
int tempDinnerCost = 0;
int totalCost = 0;
int subtractBreakfastCost = 0;
int subtractLunchCost = 0;
int subtractDinnerCost = 0;

var totalBill;
var usersAmount;

var listTile = [];

var allUsers = [
  {'name': 'All', 'money': 400},
  {'name': 'Person 1', 'money': 50},
  {'name': 'Person 2', 'money': 100},
  {'name': 'Person 3', 'money': 150},
  {'name': 'Person 4', 'money': 200},
];

var individualList = [
  {'name': 'Person 1', 'money': 50},
  {'name': 'Person 2', 'money': 100},
  {'name': 'Person 3', 'money': 150},
  {'name': 'Person 4', 'money': 200},
];

final myAddNewUserController = TextEditingController();

var date = DateTime.now();

var today = DateFormat.yMMMMEEEEd().format(date);

const appBarTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xffF4F4F8),
);

const textStyle = TextStyle(
  letterSpacing: 1.5,
  fontWeight: FontWeight.w600,
  color: Color(0xffF4F4F8),
  fontSize: 16.0,
);

const homeListStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Color(0xff2A2C41),
);

const listStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: Color(0xff2A2C41),
);
