import 'dart:math';

import 'package:flutter/material.dart';

import '../../hive/company/company.dart';
import '../../resources/colors.dart';
import '../comming_soon/comming_soon_view.dart';
import '../job_posts/job_posts_view.dart';

class CompaniesView extends StatefulWidget {
  static const String routeName = "/companiesView";

  final List<Company> companies;

  const CompaniesView({Key? key, required this.companies}) : super(key: key);

  @override
  State<CompaniesView> createState() => _CompaniesViewState();
}

class _CompaniesViewState extends State<CompaniesView> {
  final searchController = TextEditingController();
  final images = [
    "https://images.pexels.com/photos/1170412/pexels-photo-1170412.jpeg?cs=srgb&dl=pexels-cadeau-maestro-1170412.jpg&fm=jpg",
    "https://img.freepik.com/free-photo/corporate-worker-enjoying-be-back-office_23-2148804553.jpg?size=626&ext=jpg",
    "https://cdn.pixabay.com/photo/2017/01/09/20/10/laptop-in-the-office-1967479_960_720.jpg",
    "https://c.neh.tw/image_by_url?url=https://image.freepik.com/free-photo/colorful-stationery-and-apple-laid-in-random-way_23-2147847408.jpg",
    "https://thumbs.dreamstime.com/b/random-building-asheville-north-carolina-usa-taken-december-65696557.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          hintText: "Search",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                        controller: searchController,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.inputColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CommingSoonView.routeName);
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        padding: const EdgeInsets.all(2), // Border const width
                        decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.asset('assets/image/default_profile.png', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.companies.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            elevation: 10,
                            margin: const EdgeInsets.all(0),
                            shadowColor: AppColor.secondary,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  JobPostsView.routeName,
                                  arguments: widget.companies[index].companyId,
                                );
                              },
                              splashColor: AppColor.secondary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      images[Random().nextInt(5)],
                                      fit: BoxFit.fill,
                                      width: 50,
                                      height: 50,
                                    ),
                                    Text(
                                      widget.companies[index].name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(width: 20)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
