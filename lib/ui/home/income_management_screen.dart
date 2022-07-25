import 'package:flutter/material.dart';
import 'package:job_search/resources/size.dart';
import 'package:job_search/ui/home/home_viewmodel.dart';

import '../../resources/colors.dart';

class IncomeManagementScreen extends StatefulWidget {
  const IncomeManagementScreen({
    Key? key,
    required this.salaryController,
    required this.viewModel,
  }) : super(key: key);

  final TextEditingController salaryController;
  final HomeViewModel viewModel;

  @override
  State<IncomeManagementScreen> createState() => _IncomeManagementScreenState();
}

class _IncomeManagementScreenState extends State<IncomeManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/image/job_search_img.png"),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Income Management",
              style: TextStyle(fontSize: 25, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: "Your Salary"),
              controller: widget.salaryController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 20,
                color: AppColor.inputColor,
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
                setState(() {

                });
              },
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Amount for your needs",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.viewModel.getNeedsManagement(widget.salaryController.text.trim()),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Amount for invest",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.viewModel.getInvestManagement(widget.salaryController.text.trim()),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Amount for saving",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.viewModel.getSavingManagement(widget.salaryController.text.trim()),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
