import 'package:flutter/material.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/module/detailProfile/view/detail_profile_view.dart';
import 'package:jkt48_app/shared/themes/color.dart';
import 'package:jkt48_app/shared/widgets/not_found.dart';

// ignore: must_be_immutable
class GridMember extends StatelessWidget {
  GridMember({super.key, required this.member, required this.filter});

  List<JKT48Member> member;
  final String filter;

  void filterWithGen() {
    if (filter == "Gen") {
      member.sort((a, b) => a.gen.compareTo(b.gen));
    } else {
      member.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    filterWithGen();
    return member.isEmpty
        ? const NotFound()
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  children: member
                      .map((e) => Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 360,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade200, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Container(
                                        height: 180,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            e.profilePicture,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                        height: 50,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: CustomColor.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            e.name,
                                            textAlign: TextAlign.center,
                                            style: textTheme.bodyMedium!
                                                .copyWith(
                                                    color: CustomColor
                                                        .primaryColor),
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 150,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailProfileView(
                                                          jkt48Member: e),
                                                ));
                                          },
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    CustomColor.primaryColor),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Lihat Profile ->",
                                              style:
                                                  textTheme.bodySmall!.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    CustomColor.secondaryColor,
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 10,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: CustomColor.secondaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Gen ${e.gen}",
                                      style: textTheme.bodyMedium!.copyWith(
                                          color: CustomColor.primaryColor,
                                          fontSize: 12),
                                    )),
                              )
                            ],
                          ))
                      .toList()),
            ),
          );
  }
}
