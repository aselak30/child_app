// import 'package:chilld_app/ui/mp/faq_screen/faq_details.dart';
// import 'package:flutter/material.dart';
// import 'package:chilld_app/classes/language_constants.dart';

// class FaqScreen extends StatelessWidget {
//   const FaqScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final faqs = [
//       FAQ(translation(context).faq_school_q, translation(context).faq_school_a),
//       FAQ(translation(context).faq_report_violation_q,
//           translation(context).faq_report_violation_a),
//       FAQ(translation(context).faq_vote_q, translation(context).faq_vote_a),
//       FAQ(translation(context).faq_safe_online_q,
//           translation(context).faq_safe_online_a),
//       FAQ(translation(context).faq_drive_q, translation(context).faq_drive_a),
//       FAQ(translation(context).faq_rights_age_q,
//           translation(context).faq_rights_age_a),
//       FAQ(translation(context).faq_sue_q, translation(context).faq_sue_a),
//       FAQ(translation(context).faq_convict_q,
//           translation(context).faq_convict_a),
//       FAQ(translation(context).faq_work_q, translation(context).faq_work_a),
//       FAQ(translation(context).faq_who_is_child_q,
//           translation(context).faq_who_is_child_a),
//       FAQ(translation(context).faq_parents_rights_q,
//           translation(context).faq_parents_rights_a),
//       FAQ(translation(context).faq_rights_not_respected_q,
//           translation(context).faq_rights_not_respected_a),
//       FAQ(translation(context).faq_family_move_q,
//           translation(context).faq_family_move_a),
//       FAQ(translation(context).faq_rights_violated_by_known_q,
//           translation(context).faq_rights_violated_by_known_a),
//       FAQ(translation(context).faq_boys_girls_rights_q,
//           translation(context).faq_boys_girls_rights_a),
//       FAQ(translation(context).faq_lose_rights_q,
//           translation(context).faq_lose_rights_a),
//       FAQ(translation(context).faq_promote_rights_q,
//           translation(context).faq_promote_rights_a),
//       FAQ(translation(context).faq_see_rights_ignored_q,
//           translation(context).faq_see_rights_ignored_a),
//       FAQ(translation(context).faq_who_made_rules_q,
//           translation(context).faq_who_made_rules_a),
//       FAQ(translation(context).faq_examples_q,
//           translation(context).faq_examples_a),
//       FAQ(translation(context).faq_different_rights_q,
//           translation(context).faq_different_rights_a),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(translation(context).faqs),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: faqs.length,
//         itemBuilder: (context, index) {
//           final faq = faqs[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               title: Text(faq.question),
//               subtitle: Text(
//                 faq.answer,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => FaqDetailsScreen(
//                       question: faq.question,
//                       answer: faq.answer,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class FAQ {
//   final String question;
//   final String answer;

//   FAQ(this.question, this.answer);
// }
import 'package:flutter/material.dart';
import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/ui/mp/faq_screen/faq_details.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      FAQ(translation(context).faq_school_q, translation(context).faq_school_a),
      FAQ(translation(context).faq_report_violation_q,
          translation(context).faq_report_violation_a),
      FAQ(translation(context).faq_vote_q, translation(context).faq_vote_a),
      FAQ(translation(context).faq_safe_online_q,
          translation(context).faq_safe_online_a),
      FAQ(translation(context).faq_drive_q, translation(context).faq_drive_a),
      FAQ(translation(context).faq_rights_age_q,
          translation(context).faq_rights_age_a),
      FAQ(translation(context).faq_sue_q, translation(context).faq_sue_a),
      FAQ(translation(context).faq_convict_q,
          translation(context).faq_convict_a),
      FAQ(translation(context).faq_work_q, translation(context).faq_work_a),
      FAQ(translation(context).faq_who_is_child_q,
          translation(context).faq_who_is_child_a),
      FAQ(translation(context).faq_parents_rights_q,
          translation(context).faq_parents_rights_a),
      FAQ(translation(context).faq_rights_not_respected_q,
          translation(context).faq_rights_not_respected_a),
      FAQ(translation(context).faq_family_move_q,
          translation(context).faq_family_move_a),
      FAQ(translation(context).faq_rights_violated_by_known_q,
          translation(context).faq_rights_violated_by_known_a),
      FAQ(translation(context).faq_boys_girls_rights_q,
          translation(context).faq_boys_girls_rights_a),
      FAQ(translation(context).faq_lose_rights_q,
          translation(context).faq_lose_rights_a),
      FAQ(translation(context).faq_promote_rights_q,
          translation(context).faq_promote_rights_a),
      FAQ(translation(context).faq_see_rights_ignored_q,
          translation(context).faq_see_rights_ignored_a),
      FAQ(translation(context).faq_who_made_rules_q,
          translation(context).faq_who_made_rules_a),
      FAQ(translation(context).faq_examples_q,
          translation(context).faq_examples_a),
      FAQ(translation(context).faq_different_rights_q,
          translation(context).faq_different_rights_a),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).faqs,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FaqDetailsScreen(
                    question: faq.question,
                    answer: faq.answer,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.question_answer_outlined,
                        size: 28, color: Colors.blueAccent),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            faq.question,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            faq.answer,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ(this.question, this.answer);
}
