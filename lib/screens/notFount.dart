import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotFounf extends StatelessWidget {
  const NotFounf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text("kya dekh rha hai !"), Text("")],
        ),
      ),
    );
  }
}
