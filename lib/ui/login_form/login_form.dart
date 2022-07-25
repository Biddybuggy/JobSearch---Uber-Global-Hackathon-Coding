import 'package:flutter/material.dart';
import 'package:job_search/resources/pref_contracts.dart';
import 'package:job_search/resources/size.dart';
import 'package:job_search/ui/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/colors.dart';

class LoginFormArguments {
  final String userType;

  LoginFormArguments({required this.userType});
}

class LoginForm extends StatefulWidget {
  final String userType;
  static const routeName = "/loginForm";

  const LoginForm({Key? key, required this.userType}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/image/job_search_img.png"),
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(hintText: "E-mail"),
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.inputColor,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Password"),
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.inputColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(AppSize.largeButtonSize(context), 40),
                        primary: AppColor.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () async {
                      Navigator.pushNamed(context, HomeView.routeName);
                      var sharedPreference = await SharedPreferences.getInstance();
                      sharedPreference.setString(PrefContracts.USER_TYPE, widget.userType);
                      sharedPreference.setString(PrefContracts.USER_NAME, emailController.text.trim());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(AppSize.smallButtonSize(context), 40),
                  primary: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Go Back",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
