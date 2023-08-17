import 'package:flutter/material.dart';
import 'task_list.dart';
import 'app_bar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          MyAppBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: AlarmList()),
        ],
      ),
    );
  }
}
