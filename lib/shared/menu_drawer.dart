import 'package:basics/screens/bmi_screen.dart';
import 'package:basics/screens/intro_screen.dart';
import 'package:basics/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext buildContext) {
    final List<String> menuTitles = [
      'Home',
      'Bmi Calculator',
      'Weather',
    ];

    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      child: Text('Globe Fitness',
          style: TextStyle(color: Colors.white, fontSize: 28)),
      decoration: BoxDecoration(color: Colors.blueGrey),
    ));
    for (var element in menuTitles) {
      Widget screen = Container();

      menuItems.add(
        ListTile(
          title: Text(element, style: const TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'Bmi Calculator':
                screen = const BmiScreen();
                break;
              case 'Weather':
                screen = const WeatherScreen();
            }
            Navigator.of(buildContext).pop();
            Navigator.of(buildContext)
                .push(MaterialPageRoute(builder: (context) => screen));
          },
        ),
      );
    }
    return menuItems;
  }
}
