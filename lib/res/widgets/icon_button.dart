import 'package:flutter/material.dart';

import '../app_style.dart';

class MFIconButton extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;
  final Widget icon;
  final String? tooltip;
  final double padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? iconColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? shadowColor;
  final bool enableFeedback;

  const MFIconButton({
    super.key,
    this.tooltip,
    this.size = 30,
    this.onTap,
    this.borderRadius,
    required this.icon,
    this.padding = 0,
    this.color,
    this.iconColor,
    this.borderColor,
    this.splashColor,
    this.shadowColor,
    this.enableFeedback = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + padding,
      width: size + padding,
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
          side: BorderSide(color: borderColor ?? Theme.of(context).primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(defaultRadius),
          ),
          shadowColor: shadowColor
        ),
        enableFeedback: enableFeedback,
        iconSize: size,
        splashRadius: padding / 2 + size / 1.5,
        splashColor: splashColor,
        padding: EdgeInsets.zero,
        color: iconColor,
        tooltip: tooltip,
        icon: ClipOval(
          child: Material(
            color: color ?? Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(padding / 2),
              child: Center(child: icon),
            ),
          ),
        ),
      ),
    );
  }
}
