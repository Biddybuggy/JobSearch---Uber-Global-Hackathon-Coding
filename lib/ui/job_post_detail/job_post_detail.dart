import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search/resources/pref_contracts.dart';
import 'package:job_search/ui/job_post_detail/job_posts_detail_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../hive/job/job.dart';
import '../../resources/colors.dart';
import '../../resources/size.dart';

class JobPostDetailView extends StatefulWidget {
  static const String routeName = "/jobPostDetailView";

  final Job job;

  const JobPostDetailView({Key? key, required this.job}) : super(key: key);

  @override
  State<JobPostDetailView> createState() => _JobPostDetailViewState();
}

class _JobPostDetailViewState extends State<JobPostDetailView> {
  final viewModel = JobPostDetailViewModel();

  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    final currencyFormatter = NumberFormat.currency(locale: 'ID', symbol: "Rp. ");

    var applyButton = FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          String userType = snapshot.data!.getString(PrefContracts.USER_TYPE) ?? "";
          String userId = snapshot.data!.getString(PrefContracts.USER_NAME) ?? "";
          return (userType == "JA")
              ? (viewModel.isJobAppliedAlready(userId, widget.job.jobId!))
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "You've applied this job",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(AppSize.mediumButtonSize(context), 40),
                          primary: AppColor.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        viewModel.inputApplication(widget.job.jobId);
                        setState(() {});
                      },
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, letterSpacing: 2),
                      ),
                    )
              : const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    job.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondary,
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          job.companyId!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          currencyFormatter.format(double.parse(job.salary!)),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Lokasi : ${job.location!}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    job.description!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),
              applyButton
            ],
          ),
        ),
      ),
    );
  }
}
