import 'package:flutter/material.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/module/detailProfile/view/detail_profile_view.dart';
import 'package:jkt48_app/shared/themes/color.dart';
import 'package:jkt48_app/shared/widgets/not_found.dart';

// code review idCamp : 
// Code comments // ignore: ... are used to disable linting on a specific line of code. 
// However, the use of these comments should be avoided 
// because they can cause warning codes to go undetected.
class ColumnMember extends StatelessWidget {
  const ColumnMember({super.key, required this.member, required this.filter});

  // code review idCamp : 
  // The StatelessWidget class does not change the properties in it, 
  //so the properties should be declared as final. 
  final List<JKT48Member> member;
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
        : Column(
            children: member
                .map(
                  (e) => Container(
                      padding: const EdgeInsets.all(10),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade200, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                              height: 150,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  e.profilePicture,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.name,
                                        style: textTheme.bodyMedium,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      e.name == "Flora Shafiqa Riyadi"
                                          ? const Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 255, 251, 7),
                                              size: 25,
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: CustomColor.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Gen ${e.gen}",
                                          style: textTheme.bodyMedium!.copyWith(
                                              color: CustomColor.primaryColor),
                                        ),
                                      )),
                                ],
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          CustomColor.primaryColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Lihat Profile ->",
                                        style: textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: CustomColor.secondaryColor,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      )),
                )
                .toList());
  }
}
