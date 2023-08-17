import 'dart:async';
import 'package:reminder_app/res/constants.dart';
import 'package:reminder_app/common_widget/soft_button.dart';
import 'package:reminder_app/pages/home_page.dart';
import 'package:reminder_app/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => HomeCubit(),
              child: const HomeScreen(),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularSoftButton(
            radius: 60,
            icon: Center(
                child: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 35,
              width: 35,
              color: Colors.pinkAccent,
            ))),
      ),
    );
  }
}
