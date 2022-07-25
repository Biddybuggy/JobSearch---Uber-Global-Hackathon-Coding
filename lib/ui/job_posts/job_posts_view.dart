import 'package:flutter/material.dart';
import 'package:job_search/resources/colors.dart';
import 'package:job_search/ui/job_post_detail/job_post_detail.dart';
import 'package:job_search/ui/job_posts/job_post_viewmodel.dart';

class JobPostsView extends StatefulWidget {
  static const String routeName = "/jobPostsView";

  final String companyId;

  const JobPostsView({Key? key, required this.companyId}) : super(key: key);

  @override
  State<JobPostsView> createState() => _JobPostsViewState();
}

class _JobPostsViewState extends State<JobPostsView> {
  final viewModel = JobPostsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.getJobsFromCompany(widget.companyId).length,
              itemBuilder: ((context, index) {
                final item = viewModel.getJobsFromCompany(widget.companyId)[index];
                return Card(
                  elevation: 10,
                  shadowColor: AppColor.secondary,
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    splashColor: AppColor.secondary,
                    onTap: () {
                      Navigator.pushNamed(context, JobPostDetailView.routeName, arguments: item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          item.name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondary,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          item.location!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item.description!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              }),
            ))
          ]),
        ),
      ),
    );
  }
}
