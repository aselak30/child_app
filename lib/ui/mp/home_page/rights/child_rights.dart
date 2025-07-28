import 'package:chilld_app/classes/language_constants.dart';
import 'package:flutter/material.dart';

class ChildRights extends StatefulWidget {
  const ChildRights({super.key});

  @override
  State<ChildRights> createState() => _ChildRightsState();
}

class _ChildRightsState extends State<ChildRights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).learn_your_rights,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image or illustration (optional)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://www.scoutspanama.org/wp-content/uploads/2021/03/children-world.jpg", // Replace with your asset path
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Heading
            Text(
              translation(context).what_are_child_rights,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              translation(context).uncrc_child_rights_definition,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
