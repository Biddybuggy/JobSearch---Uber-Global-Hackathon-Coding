import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_search/resources/colors.dart';
import 'package:job_search/ui/login_choice/login_choice.dart';

class SplashView extends StatefulWidget {
  static const routeName = "/splash";
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _goNext() async{
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,LoginChoice.routeName);
    });
  }

  @override
  void initState() {
    super.initState();
    _goNext();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: const Center(
        child: Image(
          image: AssetImage("assets/image/job_search_img.png"),
        ),
      ),
    );
  }
}
