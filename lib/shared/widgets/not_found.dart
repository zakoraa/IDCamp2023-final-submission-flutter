import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
