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
import 'package:chilld_app/constants.dart';
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
                  side: const BorderSide(color: Colors.blueAccent, width: 1.2),
                ),
                elevation: 0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: SizedBox(
                  height: 140, // Uniform height for all cards
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 🟦 Row with image and title
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      kCardAvatar,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      faq.question,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              // 🟨 Divider line
                              Container(
                                height: 1,
                                width: 150,
                                color: Colors.grey.shade300,
                              ),

                              const SizedBox(height: 8),

                              // 🟩 Description text
                              Text(
                                faq.answer,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  height: 1.4,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));

          // Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   elevation: 3,
          //   margin: const EdgeInsets.symmetric(vertical: 8),
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(
          //         20, 16, 16, 16), // increased left padding
          //     child: Row(
          //       crossAxisAlignment:
          //           CrossAxisAlignment.center, // changed to center
          //       children: [
          //         const Icon(Icons.question_answer_outlined,
          //             size: 28, color: Colors.blueAccent),
          //         const SizedBox(
          //             width:
          //                 16), // slightly more space between icon and text
          //         Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 faq.question,
          //                 style: const TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.black87,
          //                 ),
          //               ),
          //               const SizedBox(height: 6),
          //               Text(
          //                 faq.answer,
          //                 style: const TextStyle(
          //                   fontSize: 14,
          //                   color: Colors.black54,
          //                 ),
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ],
          //           ),
          //         ),
          //         const Icon(Icons.arrow_forward_ios,
          //             size: 24, color: Colors.grey),
          //       ],
          //     ),
          //   ),
          // ));
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
