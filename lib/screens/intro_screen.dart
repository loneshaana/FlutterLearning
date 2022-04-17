import 'package:basics/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Global Fitness")),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('/tamara.jpeg'),
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Text(
              "Commit To Fit",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                shadows: [
                  Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2,
                      color: Colors.grey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
