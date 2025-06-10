import 'package:flutter/material.dart';
import 'package:movies_scope/features/home/presentation/screens/home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IndexedStack(children: [
      HomePage(),
    ],),

    );
  }
}
