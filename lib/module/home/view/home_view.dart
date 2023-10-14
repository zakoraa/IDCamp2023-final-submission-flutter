import 'package:flutter/material.dart';
import 'package:jkt48_app/data/jkt48_member_data.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/module/home/widget/grid_member.dart';
import 'package:jkt48_app/module/home/widget/search_filter.dart';
import 'package:jkt48_app/module/home/widget/column_profile_member.dart';
import 'package:jkt48_app/shared/utils/responsive.dart';

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
            child: SearchFilter(
              onSearch: onSearch,
              showFilterOptions: () => showFilterOptions(context),
            )),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Responsive.isMobile(context)
              ? ColumnMember(member: listSearchResult, filter: filter)
              : GridMember(
                  member: listSearchResult,
                  filter: filter,
                )),
    );
  }
}
