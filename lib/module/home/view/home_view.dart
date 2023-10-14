import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/JKT48.svg/1200px-JKT48.svg.png",
          height: 50,
          width: 30,
        ),
        title: Text(
          "JKT48",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child:
            Text("HaLLO WORLD", style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
