import 'package:chilld_app/classes/language_constants.dart';
import 'package:flutter/material.dart';

class RightsHelpYou extends StatefulWidget {
  const RightsHelpYou({super.key});

  @override
  State<RightsHelpYou> createState() => _RightsHelpYouState();
}

class _RightsHelpYouState extends State<RightsHelpYou> {
  @override
  Widget build(BuildContext context) {
    final loc = translation(context); // your localization accessor

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.learn_your_rights),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://www.datatrakug.com/wp-content/uploads/2024/05/30.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Heading
            Text(
              loc.how_do_child_rights_help,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Description paragraph
            Text(
              loc.child_rights_description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Bullet points
            BulletPoint(text: loc.protect_from_harm),
            BulletPoint(text: loc.guarantee_education),
            BulletPoint(text: loc.access_healthcare),
            BulletPoint(text: loc.give_a_voice),
            BulletPoint(text: loc.fight_discrimination),
            const SizedBox(height: 24),

            // Summary paragraph
            Text(
              loc.summary_superpower,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Support/protect paragraph
            Text(
              loc.support_protect_help,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for bullet points
class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ",
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                color: Colors.black87,
              )),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
