// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../widgets/drawer-Options.dart';

class AddRemoveUsers extends StatefulWidget {
  const AddRemoveUsers({super.key});

  @override
  State<AddRemoveUsers> createState() => _AddRemoveUsersState();
}

class _AddRemoveUsersState extends State<AddRemoveUsers> {
  Widget _buildUsersList() {
    return ListView.builder(
      itemCount: allUsers.length - 1,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Dismissible(
          child: ListTile(
            title: Text(
              allUsers[index + 1]['name'].toString(),
              style: listStyle,
            ),
            tileColor: themeLightColor,
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, '/profile');
              });
            },
          ),
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (direction) {
            setState(() {
              allUsers.removeAt(index + 1);
              individualList.removeAt(index);
              if (allUsers.length == 1) {
                dropDownValue = "All";
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        appBar: AppBar(
          title: Text(
            drawerText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        endDrawer: Drawer(
          elevation: 5,
          backgroundColor: themePrimaryColor,
          child: DrawerOptions(),
        ),
        body: SizedBox(
          height: double.infinity,
          child: _buildUsersList(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeTextIconColor,
          mini: true,
          onPressed: () {
            setState(() {
              myAddNewUserController.text = "";
              Navigator.pushNamed(context, '/newUser');
            });
          },
          child: Icon(
            Icons.add,
            color: themeLightColor,
          ),
        ),
      ),
    );
  }
}
