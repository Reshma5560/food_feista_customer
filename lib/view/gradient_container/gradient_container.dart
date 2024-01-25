import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                //! App Color Change to comment this line (No.22)
                // Theme.of(context).colorScheme.background,
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).scaffoldBackgroundColor,
                // Colors.red, Colors.blue
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
