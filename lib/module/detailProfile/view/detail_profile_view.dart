import 'package:flutter/material.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/shared/themes/color.dart';
import 'package:jkt48_app/shared/utils/responsive.dart';

class DetailProfileView extends StatelessWidget {
  const DetailProfileView({super.key, required this.jkt48Member});

  final JKT48Member jkt48Member;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Map<String, dynamic> data = {
      "Nama": jkt48Member.name,
      "Gen": jkt48Member.gen,
      "Tanggal Lahir": jkt48Member.dateOfBirth,
      "Golongan Darah": jkt48Member.bloodGroup,
      "Tinggi Badan": "${jkt48Member.height}cm"
    };
    return Scaffold(
        appBar: AppBar(
          title: const Text("Anggota JKT48"),
          actions: [
            jkt48Member.name == "Flora Shafiqa Riyadi"
                ? const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 251, 7),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 1, color: Colors.grey.shade300)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(jkt48Member.profilePicture)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: List.generate(data.length, (index) {
                  final key = data.keys.elementAt(index);
                  final value = data.values.elementAt(index);
                  return Padding(
                    padding: Responsive.isMobile(context)
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(key,
                                    style: textTheme.bodyMedium!
                                        .copyWith(fontSize: 16)),
                                key == "Gen"
                                    ? SizedBox(
                                      width: 130,
                                      child: Container(
                                          height: 30,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: CustomColor.primaryColor),
                                          child: Center(
                                            child: Text(
                                              "Gen $value",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: CustomColor
                                                          .secondaryColor),
                                            ),
                                          ),
                                        ),
                                    )
                                    : SizedBox(
                                      width: 130,
                                      child: Text(
                                          "$value",
                                          textAlign: TextAlign.start,
                                          style: textTheme.bodySmall!
                                              .copyWith(fontSize: 14),
                                        ),
                                    )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.shade300,
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
