import 'package:flutter/material.dart';
import 'package:job_search/ui/profile/profileViewModel.dart';

class ProfileView extends StatefulWidget {
  static const routeName = "/profile";

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    var textUserName = FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data! as String,
            style: const TextStyle(fontSize: 20),
          );
        }
        return const Text(
          "",
          style: TextStyle(fontSize: 20),
        );
      },
      future: viewModel.getUserName(),
    );

    var textUserType = FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data!) {
            case "JA":
              return const Text(
                "Job Applicants",
                style: TextStyle(fontSize: 20),
              );
            case "CA":
              return const Text(
                "Career Advisor",
                style: TextStyle(fontSize: 20),
              );
            case "CP":
              return const Text(
                "Business Owner",
                style: TextStyle(fontSize: 20),
              );
          }
        }
        return const Text("");
      },
      future: viewModel.getUserType(),
    );

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
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
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "E-mail : ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "test@mail.com",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Name : ",
                  style: TextStyle(fontSize: 20),
                ),
                textUserName,
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Phone : ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "123456789",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Type : ",
                  style: TextStyle(fontSize: 20),
                ),
                textUserType,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
