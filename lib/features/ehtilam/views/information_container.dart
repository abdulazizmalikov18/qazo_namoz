import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/core/utils/my_function.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({
    Key? key,
    required this.data,
    required this.hayz,
    required this.namoz,
  }) : super(key: key);

  final DateTime data;
  final DateTime hayz;
  final DateTime namoz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tug’ilgan kuningiz:',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, color: AppColors.textColor),
              ),
              Text(
                '${data.day} - ${MyFunctions().getmonth(data.month)},${data.year}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ehtilom/hayz vaqti:',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, color: AppColors.textColor),
              ),
              Text(
                '${hayz.day} - ${MyFunctions().getmonth(hayz.month)},${hayz.year}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Namozni boshladingiz:',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, color: AppColors.textColor),
              ),
              Text(
                '${namoz.day} - ${MyFunctions().getmonth(namoz.month)},${namoz.year}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
        ),
      ],
    );
  }
}
