import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../widgets/drawer-Options.dart';
import 'package:intl/intl.dart';

class Bills extends StatefulWidget {
  const Bills({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  Widget _buildDropdownRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Users",
            style: homeListStyle,
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: dropDownColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // Initial Value
              value: dropDownValue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              items: allUsers.asMap().entries.map((item) {
                var value = item.value;
                return DropdownMenuItem(
                  value: value['name'],
                  child: Text(
                    value['name'].toString(),
                    style: homeListStyle,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropDownValue = newValue.toString();
                  if (newValue.toString() != 'All') {
                    individualList = [];
                    for (var item in allUsers) {
                      if (newValue.toString() == item['name']) {
                        individualList.add(item);
                        usersAmount = item['money'];
                      }
                    }
                  } else {
                    usersAmount = allUsers[0]['money'];
                    individualList = [];
                    for (var item in allUsers) {
                      if (item['name'] != 'All') {
                        individualList.add(item);
                      }
                    }
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            "Date",
            style: homeListStyle,
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: dropDownColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(today, style: listStyle),
            ),
            onTap: () => _selectDate(context),
          ),
        )
      ],
    );
  }

  Widget _buildUsersList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
        itemCount: individualList.length,
        itemBuilder: (context, index) => (Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: ListTile(
            title: Text(
              "${individualList[index]['name'].toString()} :  ${individualList[index]['money'].toString()} ₹",
              style: listStyle,
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildTotalBill() {
    totalBill = usersAmount;
    return Center(
      child: Text(
        "$totalBill/-",
        style: homeListStyle,
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: dropDownColor, // <-- SEE HERE
              onPrimary: themeLightColor, // <-- SEE HERE
              onSurface: themeTextIconColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: dropDownColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        today = DateFormat.yMMMMEEEEd().format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    totalBill = allUsers[0]['money'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text(
            bills,
            style: appBarTextStyle,
          ),
        ),
        endDrawer: Drawer(
          elevation: 5,
          backgroundColor: themePrimaryColor,
          child: DrawerOptions(),
        ),
        body: Container(
          color: themeColor,
          height: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownRow(),
              _buildDateRow(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Individuals :",
                  style: homeListStyle,
                ),
              ),
              _buildUsersList(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Total Bill :",
                  style: homeListStyle,
                ),
              ),
              _buildTotalBill(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeTextIconColor,
          mini: true,
          child: Icon(
            Icons.share,
            color: themeLightColor,
          ),
          onPressed: () => {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
