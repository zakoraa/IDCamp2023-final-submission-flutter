import 'package:flutter/material.dart';
import 'package:jkt48_app/data/jkt48_member_data.dart';
import 'package:jkt48_app/shared/themes/color.dart';

class ProfileMember extends StatelessWidget {
  const ProfileMember({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
        children: listMember
            .map(
              (e) => Container(
                  padding: const EdgeInsets.all(10),
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 150,
                          width: 100,
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
                              Text(
                                e.name,
                                style: textTheme.bodyMedium,
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Gen ${e.gen}",
                                      style: textTheme.bodyMedium!.copyWith(
                                          color: CustomColor.primaryColor),
                                    ),
                                  )),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                
                                backgroundColor: MaterialStatePropertyAll(
                                    CustomColor.primaryColor),
                              ),
                              child: Center(
                                child: Text(
                                  "Lihat Detail Profile Member  ->",
                                  style: textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: CustomColor.secondaryColor,
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  )),
            )
            .toList());
  }
}
