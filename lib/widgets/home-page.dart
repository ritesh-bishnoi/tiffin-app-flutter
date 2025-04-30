import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/constants.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  // Color _tabBackground = Color(0xff333E3D);

  Widget _buildDateTimeBar() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff2A2C41),
      //color: _tabBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            today,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 20.0),
            splashRadius: 12,
            color: Color(0xffFFCD29),
            icon: Icon(Icons.arrow_drop_down_rounded),
            iconSize: 50,
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoWidget() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        splashRadius: 18,
        iconSize: 28,
        icon: Icon(Icons.info),
        onPressed: () => setState(() {
          Navigator.pushNamed(context, '/profile');
        }),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          'WELCOME TO HOME',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBreakfastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Breakfast",
            style: homeListStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              countBreakfast++;
              tempBreakfastCost = breakfastCost * countBreakfast;
              subtractBreakfastCost = tempBreakfastCost;
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            countBreakfast.toString(),
            style: homeListStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.remove),
            onPressed: () => setState(() {
              countBreakfast--;
              if (countBreakfast > 0) {
                tempBreakfastCost = subtractBreakfastCost - breakfastCost;
              } else {
                tempBreakfastCost = 0;
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildLunchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Lunch",
            style: homeListStyle,
          ),
        ),
        SizedBox(
          width: 36,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              countLunch++;
              tempLunchCost = lunchCost * countLunch;
              subtractLunchCost = tempLunchCost;
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            countLunch.toString(),
            style: homeListStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.remove),
            onPressed: () => setState(() {
              countLunch--;
              if (countLunch > 0) {
                tempLunchCost = subtractLunchCost - lunchCost;
              } else {
                tempLunchCost = 0;
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildDinnerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Dinner",
            style: homeListStyle,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              countDinner++;
              tempDinnerCost = dinnerCost * countDinner;
              subtractDinnerCost = tempDinnerCost;
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            countDinner.toString(),
            style: homeListStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashRadius: 12,
            icon: Icon(Icons.remove),
            onPressed: () => setState(() {
              countDinner--;
              if (countDinner > 0) {
                tempDinnerCost = subtractDinnerCost - dinnerCost;
              } else {
                tempDinnerCost = 0;
              }
            }),
          ),
        ),
      ],
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

  // Widget _buildCards(context) {
  //   return TCard(
  //     size: Size(MediaQuery.of(context).size.width,
  //         MediaQuery.of(context).size.height / 1.5),
  //     cards: List.generate(
  //       allUsers.length,
  //       (index) => Container(
  //         color: themeLightColor,
  //         // height: MediaQuery.of(context).size.height,
  //         // width: MediaQuery.of(context).size.width,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             _buildInfoWidget(),
  //             _buildProfileWidget(),
  //             _buildBreakfastRow(),
  //             _buildLunchRow(),
  //             _buildDinnerRow(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDateTimeBar(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 5,
            child: Container(
              color: themeLightColor,
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  _buildInfoWidget(),
                  _buildProfileWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildBreakfastRow(),
                  _buildLunchRow(),
                  _buildDinnerRow(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
