import 'package:flutter/material.dart';
import 'package:jkt48_app/data/jkt48_member_data.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/module/home/widget/bottom_on_app_bar.dart';
import 'package:jkt48_app/module/home/widget/profile_member.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<JKT48Member> listSearchResult = List.from(listMember);

  void onSearch(String text) {
    setState(() {
      listSearchResult = listMember
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 20),
            child: BottomOnAppBar(
              onSearch: onSearch,
            )),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: listSearchResult.isEmpty
              ? Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Not Found",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                )
              : ProfileMember(member: listSearchResult)),
    );
  }
}
