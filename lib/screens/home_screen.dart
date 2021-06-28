import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    tabPage.stacks.map((stack) => {print(stack)});

    return Scaffold(
      body: IndexedStack(
        index: tabPage.index,
        children: [
          for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabPage.index,
        items: [
          BottomNavigationBarItem(label: "Tasks", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
        onTap: (index) {
          tabPage.index = index;
        },
      ),
    );
  }
}
