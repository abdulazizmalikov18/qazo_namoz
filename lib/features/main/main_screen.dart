import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/features/information/information_view.dart';
import 'package:qazo_namaz/features/main/views/main_view.dart';
import 'package:qazo_namaz/features/settings/setttings_view.dart';
import 'package:qazo_namaz/features/zikrlar/zikirlar_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> body = [
    const HomeView(),
    const ZikirlarView(),
    const InformationView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.gren,
        unselectedItemColor: AppColors.bottomUnselected,
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.moon),
            label: 'Zikrlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'Ma’lumot',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Sozlamalar',
          ),
        ],
      ),
    );
  }
}
