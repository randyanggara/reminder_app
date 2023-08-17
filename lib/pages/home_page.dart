import 'package:reminder_app/view_model/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/body.dart';
import '../components/floating_button.dart';
import '../res/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  // Initial Selected Value
  String selectedDay = 'Monday';
  String selectedTask = 'Wake up';
  // List of items in our dropdown menu
  var days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  var tasks = [
    'Wake up',
    'Go to gym',
    'Breakfast',
    'Meetings',
    'Lunch',
    'Quick nap',
    'Go to library',
    'Dinner',
    'Go to sleep',
  ];

  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          // FloatingActionButton(
          //   child: const Icon(
          //     Icons.add,
          //     color: Colors.pinkAccent,
          //     size: 30,
          //   ),
          //   onPressed: () {

          //     //BlocProvider.of<HomeCubit>(context)
          //      //   .addData(context, 'Thursday', 'Yes');
          //   },
          // ),
          const FloatingButton(),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}
