import 'package:reminder_app/services/alarm_service.dart';
import 'package:reminder_app/view_model/home_states.dart';
import 'package:reminder_app/services/database_helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/alarm_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(NoData());
  final DbHelper helper = DbHelper();
  late Future<List<AlarmModel>> list;

  void getData() async {
    helper.getData().then((value) {
      list = Future.value(value);
      emit(HasData());
    });
  }

  void addData(BuildContext context, String day, String task) async {
    var picker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Set Time for $task on $day",
    );
    if (picker != null) {
      MyAlarm.setAlarm(picker, context, day, task);
    }
  }

  Future<Duration> getDifferenceBetweenCurrentTimeAndSelectedTime(
      TimeOfDay selectedTime) async {
    final now = DateTime.now();
    final selectedDateTime = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    return selectedDateTime.difference(now);
  }
}
