import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';

class MyIndicatorWidgets extends StatelessWidget {
  const MyIndicatorWidgets({
    Key? key,
    required this.myIndex,
    required this.size,
    required this.pageControllersList,
    required this.index,
  }) : super(key: key);

  final int myIndex;
  final int index;
  final Size size;
  final List<PageController> pageControllersList;

  static const time = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: time,
      child: myIndex == index
          ? GestureDetector(
              onTap: () {
                pageControllersList[0]
                    .animateToPage(index, duration: time, curve: Curves.ease);
                pageControllersList[1]
                    .animateToPage(index, duration: time, curve: Curves.ease);
              },
              key: const Key('1'),
              child: Container(
                height: 16,
                width: 36,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gren,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                pageControllersList[0]
                    .animateToPage(index, duration: time, curve: Curves.ease);
                pageControllersList[1]
                    .animateToPage(index, duration: time, curve: Curves.ease);
              },
              key: const Key('2'),
              child: Container(
                height: 16,
                width: 16,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gren.withOpacity(.5),
                ),
              ),
            ),
    );
  }
}
