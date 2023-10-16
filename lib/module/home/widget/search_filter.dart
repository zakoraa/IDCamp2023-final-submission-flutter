// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jkt48_app/shared/themes/color.dart';

class SearchFilter extends StatelessWidget {
  // code review idCamp :
  // It is recommended that in 1 line of code the number of characters used does not exceed 80 characters.
  // If the number of characters exceeds 80,
  // you can move part of the code to the next line to make it easier to read and maintain the code.
  // One way to get around the 80 character limit is to add a comma to the last item in a line of code,
  // then continue with a new line for the next item. This is called the "trailing comma" technique.
  // This technique can help avoid errors when adding or removing items in a line of code.
  const SearchFilter(
      {super.key, required this.onSearch, required this.showFilterOptions});

  final onSearch;
  final Function showFilterOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onSearch,
              cursorColor: CustomColor.primaryColor,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: CustomColor.primaryColor,
                hintText: "Search Member",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () => showFilterOptions(),
            child: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),

            // code review idCamp :
            // Add a comma (,) at the end of the parameter or widget
            // to make formatting and indentation neater.
          ),
        ],
      ),
    );
  }
}
