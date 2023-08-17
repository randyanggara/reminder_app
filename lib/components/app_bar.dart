import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Schedule',
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(color: Colors.black, fontSize: 50),
    );
  }
}
