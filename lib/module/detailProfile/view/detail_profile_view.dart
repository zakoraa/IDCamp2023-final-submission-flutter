import 'package:flutter/material.dart';
import 'package:jkt48_app/model/jkt48_member_model.dart';
import 'package:jkt48_app/shared/themes/color.dart';

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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(jkt48Member.profilePicture)),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: List.generate(data.length, (index) {
                final text = data.keys.elementAt(index);
                final dataMember = data.values.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(text,
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontSize: 16)),
                              text == "Gen"
                                  ? Container(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: CustomColor.primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Gen $dataMember",
                                          style: textTheme.bodyMedium!.copyWith(
                                              color:
                                                  CustomColor.secondaryColor),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "$dataMember",
                                      textAlign: TextAlign.start,
                                      style: textTheme.bodySmall!
                                          .copyWith(fontSize: 14),
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
        ));
  }
}
