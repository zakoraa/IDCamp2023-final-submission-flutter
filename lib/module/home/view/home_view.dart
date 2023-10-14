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
  String filter = "Nama";

  void onSearch(String text) {
    setState(() {
      listSearchResult = listMember
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void showFilterOptions(BuildContext context) {
    final List<String> options = [
      'Nama',
      'Gen',
    ];

    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(
          150, 150, 0, 0), // Change the position as needed
      items: options.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(
            option,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            setState(() {
              filter = option;
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/JKT48.svg/1200px-JKT48.svg.png",
            ),
          ),
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
              showFilterOptions: () => showFilterOptions(context),
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
              : ProfileMember(
                  member: listSearchResult,
                  filter: filter,
                )),
    );
  }
}
