import 'package:chilld_app/classes/language_constants.dart';
import 'package:flutter/material.dart';

class RightsOfTheChild extends StatelessWidget {
  const RightsOfTheChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).learn_your_rights),
        backgroundColor: Colors.white,
      ),
      body: InteractiveViewer(
        scaleEnabled: false,
        constrained: false,
        boundaryMargin: const EdgeInsets.all(15),
        child: Image.network(
          'https://kids.srilankaunites.org/wp-content/uploads/2024/10/Picture1-1536x745.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
