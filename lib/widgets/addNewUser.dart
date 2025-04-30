import 'package:flutter/material.dart';
import '../widgets/drawer-Options.dart';
import '../shared/constants.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  Widget _buildProfileWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {},
            ),
            Text(
              "Add Profile Photo",
              style: listStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextfield() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 40,
        color: Colors.white,
        child: TextField(
          controller: myAddNewUserController,
          decoration: InputDecoration(
            hintText: 'Full Name',
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildAddUserButton() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListTile(
        tileColor: dropDownColor,
        onTap: () => setState(() {
          if (myAddNewUserController.text.isNotEmpty) {
            var value = {'name': myAddNewUserController.text, 'money': 0};
            allUsers.add(value);
            individualList.add(value);
            Navigator.pushNamed(context, '/addUsers');
          }
        }),
        title: Center(
            child: Text(
          "ADD USER",
          style: homeListStyle,
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text(
            addUser,
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
        body: Column(
          children: [
            _buildProfileWidget(context),
            _buildNameTextfield(),
            Spacer(),
            _buildAddUserButton(),
          ],
        ),
      ),
    );
  }
}
