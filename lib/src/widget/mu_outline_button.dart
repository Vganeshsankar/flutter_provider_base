import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final Color? backgroundColor;
  final void Function()? onPressed;
  final Widget? child;

  const MyOutlineButton({
    super.key,
    this.backgroundColor,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => backgroundColor,
        ),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 56.32)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      child: child ,
    );
  }
}
