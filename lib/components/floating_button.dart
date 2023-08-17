import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/home_cubit.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  bool floatExtended = false;
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

  Future<void> showInformationDialog(BuildContext context) async {
    final home_context = context;
    return await showDialog(
        context: home_context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton(
                    value: selectedDay,
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of days
                    items: days.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                  ),
                  DropdownButton(
                    // Initial Value
                    value: selectedTask,
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of tasks
                    items: tasks.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTask = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                ],
              )),
              actions: [
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    print('day: $selectedDay');
                    print('task: $selectedTask');
                  },
                ),
              ],
              title: Text('Add Task'),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final home_context = context;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          tooltip: 'Add Task',
          label: Row(
            children: [
              IconButton(
                  onPressed: () {
                    showInformationDialog(home_context);
                  },
                  icon: Icon(Icons.date_range)),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context)
                        .addData(home_context, selectedDay, selectedTask);
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          isExtended: floatExtended,
          icon: Icon(
            floatExtended == true ? Icons.close : Icons.add,
            color: floatExtended == true ? Colors.red : Colors.black,
          ),
          onPressed: () {
            setState(() {
              floatExtended = !floatExtended;
            });
          },
        ),
      ],
    );
  }
}
