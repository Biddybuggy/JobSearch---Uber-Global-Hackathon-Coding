import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_search/resources/colors.dart';
import 'package:job_search/ui/home/income_management_screen.dart';
import 'package:job_search/ui/job_add_form/add_job_form.dart';

import '../../hive/boxes.dart';
import '../../hive/company/company.dart';
import 'home_screen.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  final TextEditingController searchController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  var _selectedIndex = 0;
  final images = [
    "https://images.pexels.com/photos/1170412/pexels-photo-1170412.jpeg?cs=srgb&dl=pexels-cadeau-maestro-1170412.jpg&fm=jpg",
    "https://img.freepik.com/free-photo/corporate-worker-enjoying-be-back-office_23-2148804553.jpg?size=626&ext=jpg",
    "https://cdn.pixabay.com/photo/2017/01/09/20/10/laptop-in-the-office-1967479_960_720.jpg",
    "https://c.neh.tw/image_by_url?url=https://image.freepik.com/free-photo/colorful-stationery-and-apple-laid-in-random-way_23-2147847408.jpg",
    "https://thumbs.dreamstime.com/b/random-building-asheville-north-carolina-usa-taken-december-65696557.jpg"
  ];

  List<String> imagesName = ["Ethan", "Dylan", "Abbra"];
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    var floatingActionButton = FutureBuilder<String>(
      future: viewModel.getUserType(),
      builder: ((context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          String userType = snapshot.data!;
          return (userType == "JA" || userType == "")
              ? const SizedBox()
              : FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColor.secondary,
                  onPressed: () {
                    if (userType == "CP") {
                      Navigator.pushNamed(context, JobAddForm.routeName);
                    }
                  },
                  child: const Icon(Icons.add_circle),
                );
        } else {
          return const SizedBox();
        }
      }),
    );

    return Scaffold(
      body: ValueListenableBuilder<Box<Company>>(
          valueListenable: Boxes.getCompanies().listenable(),
          builder: (context, value, child) => SafeArea(
              child: (_selectedIndex == 0)
                  ? HomeScreen(
                      imagesName: imagesName,
                      searchController: searchController,
                      companies: value.values.toList().reversed.toList(),
                      images: images,
                    )
                  : (_selectedIndex == 1)
                      ? commingSoonScreen()
                      : IncomeManagementScreen(
                          salaryController: salaryController,
                          viewModel: viewModel,
                        ))),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Management',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.secondary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget commingSoonScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.developer_board,
            size: 100,
          ),
          Text(
            "COMING SOON",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
