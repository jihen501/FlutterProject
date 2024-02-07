import 'package:flutter/material.dart';
import 'package:firstapplication/Models/menu.dart';

class MenusList extends StatelessWidget {
  const MenusList({super.key, required this.menu});

  final List<Menu> menu;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        final menuItem = menu[index];
        return Center(
          child: buildMenuCard(context, menuItem),
        );
      },
    );
  }

  Widget buildMenuCard(BuildContext context, Menu menuItem) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month_outlined, color: Colors.white),
                const SizedBox(width: 16.0),
                Text(
                  menuItem.day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          buildCardContainer(context, getCourseName(menuItem.mainCourse),
              const Icon(Icons.restaurant_menu)),
          const SizedBox(height: 4.0),
          buildCardContainer(context, getCourseName(menuItem.entree),
              const Icon(Icons.restaurant)),
          const SizedBox(height: 4.0),
          buildCardContainer(context, getCourseName(menuItem.dessert),
              const Icon(Icons.cookie_outlined)),
        ],
      ),
    );
  }

  Widget buildCardContainer(BuildContext context, String text, Icon icon) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon.icon,
                color: Colors.blue[800],
              ),
              const SizedBox(width: 16.0),
              Text(
                text,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCourseName(dynamic course) {
    switch (course) {
      case MainCourse.kouskous:
        return 'Kouskous';
      case MainCourse.makrouna:
        return 'Makrouna';
      case MainCourse.rouz:
        return 'Rouz';
      case MainCourse.chakchouka:
        return 'Chakchouka';
      case MainCourse.mlokheya:
        return 'Mlokheya';
      case Entree.saladeMechouia:
        return 'Salade Mechouia';
      case Entree.saladeRusse:
        return 'Salade Russe';
      case Entree.saladeTunisienne:
        return 'Salade Tunisienne';
      case Dessert.bordguen:
        return 'Bordguen';
      case Dessert.toffeh:
        return 'Toffeh';
      case Dessert.yaghort:
        return 'Yaghort';
      default:
        return '';
    }
  }
}
