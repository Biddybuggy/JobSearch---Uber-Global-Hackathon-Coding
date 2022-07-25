import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_search/resources/colors.dart';

import '../../resources/size.dart';
import '../home/home_view.dart';

class RegisterView extends StatefulWidget {
  static const routeName = "/register";

  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var dropdownValue = "Job Applicant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
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
                  TextField(
                    decoration: const InputDecoration(hintText: "Name"),
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.inputColor,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Phone"),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.inputColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Who Are You? ",
                          style: TextStyle(color: AppColor.inputColor, fontSize: 12),
                        ),
                        const SizedBox(width: 20),
                        DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: ["Job Applicant", "Career Advisor", "Company Representator"]
                              .map((value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: AppColor.inputColor, fontSize: 12),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value as String;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(AppSize.mediumButtonSize(context), 40),
                        primary: AppColor.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, HomeView.routeName);
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              )),
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
            ],
          ),
        ),
      ),
    );
  }
}
