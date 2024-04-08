import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          widget.navigationShell.goBranch(
            value,
            initialLocation: value == widget.navigationShell.currentIndex,
          );
        },
        selectedItemColor: AppColors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.home.svg(
              color: widget.navigationShell.currentIndex == 0
                  ? AppColors.green
                  : null,
            ),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.moon.svg(
              color: widget.navigationShell.currentIndex == 1
                  ? AppColors.green
                  : null,
            ),
            label: "Zikrlar",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.infoCircle.svg(
              color: widget.navigationShell.currentIndex == 2
                  ? AppColors.green
                  : null,
            ),
            label: "Ma’lumot",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.settingBottom.svg(
              color: widget.navigationShell.currentIndex == 3
                  ? AppColors.green
                  : null,
            ),
            label: "Sozlamalar",
          ),
        ],
      ),
    );
  }
}
