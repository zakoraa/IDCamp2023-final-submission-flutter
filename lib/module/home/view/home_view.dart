import 'package:flutter/material.dart';
import 'package:jkt48_app/module/home/widget/bottom_on_app_bar.dart';
import 'package:jkt48_app/module/home/widget/profile_member.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/JKT48.svg/1200px-JKT48.svg.png",
          height: 200,
          width: 70,
        ),
        title: Text(
          "JKT48",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontSize: 20),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 20),
            child: BottomOnAppBar()),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ProfileMember(),
      ),
    );
  }
}
