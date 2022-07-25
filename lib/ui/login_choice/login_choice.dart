import 'package:flutter/material.dart';
import 'package:job_search/resources/colors.dart';
import 'package:job_search/ui/login_form/login_form.dart';
import 'package:job_search/ui/register/register.dart';

class LoginChoice extends StatefulWidget {
  static const routeName = "/login_choice";

  const LoginChoice({Key? key}) : super(key: key);

  @override
  State<LoginChoice> createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [
            const Image(
              image: AssetImage("assets/image/job_search_img.png"),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Log in as : ",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, LoginForm.routeName,arguments: LoginFormArguments(userType: "JA"));
              },
              child: const Text(
                "Job Applicant",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, LoginForm.routeName,arguments: LoginFormArguments(userType: "CA"));
              },
              child: const Text(
                "Career Advisor",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, LoginForm.routeName,arguments: LoginFormArguments(userType: "CP"));
              },
              child: const Text(
                "Business",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColor.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterView.routeName);
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
