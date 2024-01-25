import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../app_style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? elevation;
  final Color? bgColor;
  final double? toolbarHeight;
  final bool? centerTitle;
  final TextStyle? titleStyle;
  final VoidCallback? onTap;
  final List<Widget>? actions;
  final VoidCallback? titleOnTap;
  final Widget? child;
  final Widget? leading;
  @override
  final Size preferredSize;
  final PreferredSizeWidget? bottom;

  MyAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.bgColor,
    this.elevation,
    this.toolbarHeight,
    this.centerTitle,
    this.bottom,
    this.onTap,
    this.actions,
    this.titleOnTap,
    this.child,
    this.leading,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize && preferredSize.toolbarHeight == null) {
      return (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) + (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).primaryColor,
      elevation: elevation,
      centerTitle: centerTitle ?? false,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      leading: leading,
      title: GestureDetector(
        onTap: titleOnTap,
        child: child ??
            Text(
              title ?? "",
              style: titleStyle ?? AppStyle.customAppBarTitleStyle(),
            ),
      ),
      actions: !isValEmpty(actions)
          ? [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding / 1.7),
                child: Row(
                  children: actions!,
                ),
              ),
            ]
          : null,
    );
  }
}

class _PreferredAppBarSize extends Size {
  final double? toolbarHeight;
  final double? bottomHeight;

  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
        );
}
