import 'dart:math';
import 'package:alarm/alarm.dart';
import 'package:reminder_app/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/alarm_model.dart';

class MyAlarm {
  static void setAlarm(
      TimeOfDay time, BuildContext context, String day, String task) {
    final timeOfDay = time;
    final nextDay = DateTime.now().add(const Duration(days: 1));
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, timeOfDay.hour, timeOfDay.minute);
    if (dateTime.isBefore(DateTime.now())) {
      dateTime = nextDay;
    }
    final alarmSettings = AlarmSettings(
      id: Random().nextInt(100),
      dateTime: dateTime,
      assetAudioPath: 'assets/audio/daybreak.mp3',
      loopAudio: true,
      vibrate: true,
      volumeMax: true,
      fadeDuration: 3.0,
      notificationTitle: task,
      notificationBody: 'Tap to stop',
      enableNotificationOnKill: true,
      stopOnNotificationOpen: true,
    );
    Alarm.set(alarmSettings: alarmSettings).then((value) {
      BlocProvider.of<HomeCubit>(context).helper.insert(AlarmModel(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          hour: time.hourOfPeriod.toString(),
          period: time.period.name,
          min: time.minute.toString(),
          day: day,
          isEnabled: 'true',
          alarmId: alarmSettings.id.toString(),
          title: task));
    }).then((value) {
      BlocProvider.of<HomeCubit>(context).getData();
    });
  }
}
