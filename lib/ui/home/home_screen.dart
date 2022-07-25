import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:job_search/ui/companies/companies_view.dart';
import 'package:job_search/ui/job_posts/job_posts_view.dart';
import 'package:job_search/ui/profile/profile_view.dart';

import '../../hive/company/company.dart';
import '../../resources/colors.dart';
import '../comming_soon/comming_soon_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.searchController,
    required this.companies,
    required this.images,
    required this.imagesName,
  }) : super(key: key);

  final TextEditingController searchController;
  final List<Company> companies;
  final List<String> images;
  final List<String> imagesName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
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
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfileView.routeName);
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
              )
            ],
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Suggested Companies",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.builder(
                  itemCount: (companies.length > 3) ? 3 : companies.length,
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
                                arguments: companies[index].companyId,
                              );
                            },
                            splashColor: AppColor.secondary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    images[Random().nextInt(5)],
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text(
                                    companies[index].name!,
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
              Card(
                shadowColor: AppColor.secondary,
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CompaniesView.routeName, arguments: companies);
                  },
                  splashColor: AppColor.secondary,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "See More",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Suggested Courses",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) => Column(
                  children: [
                    Expanded(child: Image.network(images[Random().nextInt(3)], fit: BoxFit.fill,width: MediaQuery.of(context).size.width,)),
                    Text("By : ${imagesName[index]}", style: TextStyle(fontSize: 20),)
                  ],
                ),
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  onPageChanged: (position, reason) {},
                  enableInfiniteScroll: false,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
