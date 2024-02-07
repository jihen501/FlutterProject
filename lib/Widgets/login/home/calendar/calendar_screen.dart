import 'package:flutter/material.dart';
import 'package:firstapplication/Widgets/navbar.dart';
import 'package:firstapplication/Widgets/appbar.dart';
import 'package:firstapplication/Models/menu.dart';

// import 'package:Flutter_Workshop_2/Widgets/CalendarScreenWidgets/menus_list.dart';

class Calendar_screen extends StatefulWidget {
  const Calendar_screen({super.key});

  @override
  State<Calendar_screen> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<Calendar_screen> {
  final List<Menu> _registeredMenus = [
    Menu(
        day: "Monday",
        mainCourse: MainCourse.chakchouka,
        entree: Entree.SaladeMechouia,
        dessert: Dessert.Bordguen),
    Menu(
        day: "Tueday",
        mainCourse: MainCourse.kouskous,
        entree: Entree.SaladeRusse,
        dessert: Dessert.Yaghort),
  ];

/*
  void _openAddMenuOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewMenu(onAddMenu: _addMenu),
    );
  }

  void _addMenu(Menu menu) {
    setState(() {
      _registeredMenus.add(menu);
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No Menu yet!"));

    if (_registeredMenus.isNotEmpty) {
      mainContent = MenusList(
        menu: _registeredMenus,
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 16.0), // Adjust the left margin as needed
          child: IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.blue[700],
              size: 48,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 40),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.receipt_long_rounded,
                color: Colors.amber,
                size: 48,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
              color: Colors.white,
              child: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Contribute to next week's Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
