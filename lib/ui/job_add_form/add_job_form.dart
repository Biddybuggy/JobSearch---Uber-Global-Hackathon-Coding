import 'package:flutter/material.dart';
import 'package:job_search/ui/job_add_form/job_add_form_viewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../resources/colors.dart';

class JobAddForm extends StatefulWidget {
  static const String routeName = "/jobAddForm";

  const JobAddForm({Key? key}) : super(key: key);

  @override
  State<JobAddForm> createState() => _JobAddFormState();
}

class _JobAddFormState extends State<JobAddForm> {
  final viewModel = JobAddFormViewModel();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  String dropdownValue = "TANGERANG";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Image(
                          image: AssetImage("assets/image/job_search_img.png"),
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
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
                          decoration: const InputDecoration(hintText: "Description"),
                          textInputAction: TextInputAction.next,
                          controller: descriptionController,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.inputColor,
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(hintText: "Salary"),
                          textInputAction: TextInputAction.next,
                          controller: salaryController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.inputColor,
                          ),
                        ),
                        DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: ["TANGERANG", "JAKARTA"]
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
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            viewModel.inputJobs(name: nameController.text.trim(), description: descriptionController.text.trim(), salary: salaryController.text.trim(), location: dropdownValue);
                            Fluttertoast.showToast(
                              msg: "Success",
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                            );
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "POST IT!",
                            style: TextStyle(color: Colors.white, letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
