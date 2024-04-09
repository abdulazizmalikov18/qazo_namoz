import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.disabledColor = Colors.grey,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: CupertinoButton(
        color: isDisabled ? disabledColor : color ?? AppColors.green,
        onPressed: () {
          if (!(isLoading || isDisabled)) {
            onTap();
          }
        },
        pressedOpacity: isDisabled ? 1 : 0.5,
        borderRadius: BorderRadius.circular(borderRadius),
        child: isLoading
            ? Center(child: CupertinoActivityIndicator(color: textColor))
            : DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      height: 1.36,
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                child: child ??
                    Text(
                      text,
                      style: textStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
              ),
      ),
    );
  }
}
