import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'drawer-Options.dart';
import 'package:intl/intl.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
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

  Widget _buildDateTimeRow() {
    return Row(
      children: [
        Text(
          today,
          style: TextStyle(color: themeTextIconColor, fontSize: 20),
        ),
        IconButton(
          color: themeTextIconColor,
          icon: Icon(Icons.date_range),
          onPressed: () => _selectDate(context),
        )
      ],
    );
  }

  Widget _buildNotesField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: dropDownColor,
        child: TextFormField(
          minLines: 6,
          maxLines: null,
          style: homeListStyle,
          decoration: InputDecoration(
            hintText: 'Note For Date',
            hintStyle: homeListStyle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeTextIconColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeTextIconColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    totalCost = tempBreakfastCost + tempLunchCost + tempDinnerCost;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text(
            'Home',
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
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(18.0),
          color: themeColor,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateTimeRow(),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Breakfast : $countBreakfast",
                    style: homeListStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lunch : $countLunch",
                    style: homeListStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Dinner : $countDinner",
                    style: homeListStyle,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Today's Total Bill : $totalCost ₹",
                    style: homeListStyle,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildNotesField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
