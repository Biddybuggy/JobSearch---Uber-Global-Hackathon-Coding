import 'package:flutter/material.dart';

class CommingSoonView extends StatelessWidget {
  static const routeName = "/commingSoon";
  const CommingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.developer_board,
              size: 100,
            ),
            Text("COMING SOON",style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
