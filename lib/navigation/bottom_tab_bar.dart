import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class TabItem {
  String label;
  String path;
  Icon icon;

  TabItem({required this.label, required this.path, required this.icon});
}

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabItems = [
      TabItem(label: "Tasks", icon: Icon(Icons.home), path: '/tabs/tasks'),
      TabItem(
          label: "Settings",
          icon: Icon(Icons.settings),
          path: '/tabs/settings'),
    ];

    print(context.vRouter.path);

    return BottomNavigationBar(
      currentIndex: 0,
      items: tabItems.map((item) {
        return BottomNavigationBarItem(label: item.label, icon: item.icon);
      }).toList(),
      onTap: (index) {
        context.vRouter.push(tabItems[index].path);
      },
    );
  }
}
