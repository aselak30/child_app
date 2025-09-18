import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_list_model.dart';
import 'package:chilld_app/services/posts_service.dart';
import 'package:chilld_app/ui/mp/home_page/full_post_screen.dart';
import 'package:chilld_app/ui/mp/home_page/rights/child_rights.dart';
import 'package:chilld_app/ui/mp/home_page/rights/rights_help_you.dart';
import 'package:chilld_app/ui/mp/home_page/rights/rights_of_the_child.dart';
import 'package:chilld_app/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final listController = ScrollController();

  List<PostListModel> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  bool _isFabVisible = true;
  final bool _isFabExpanded = false;

  String selectedLanguage = "english"; // default

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch();
    // listController.addListener(() {
    //   if (listController.position.maxScrollExtent == listController.offset) {
    //     fetch();
    //   }
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final appLanguage = translation(context).localeName;

    String newLanguage;
    if (appLanguage == "en") {
      newLanguage = "english";
    } else if (appLanguage == "si") {
      newLanguage = "sinhala";
    } else if (appLanguage == "ta") {
      newLanguage = "tamil";
    } else {
      newLanguage = "english"; // fallback
    }

    // Only reload when language really changes
    if (newLanguage != selectedLanguage || items.isEmpty) {
      setState(() {
        selectedLanguage = newLanguage;
        items.clear();
        page = 1;
        hasMore = true;
      });
      fetch();
    }
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 25;

    // final url = Uri.parse(
    //     'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    // final response = await http.get(url);

    // if (response.statusCode == 200) {
    // final List newItems = json.decode(response.body);

    final newItems = await PostsService.getPosts(context, selectedLanguage);

    setState(() {
      page++;
      isLoading = false;

      if (newItems.length < limit) {
        hasMore = false;
      }
      items.addAll(newItems.map<PostListModel>(
        (item) {
          // final number = item.id;
          return item;
        },
      ).toList());
    });
    // }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1; // ✅ start from first page
      items.clear();
    });
    fetch();
  }

  // Future refresh() async {
  //   setState(() {
  //     isLoading = false;
  //     hasMore = true;
  //     page = 0;
  //     items.clear();
  //   });
  //   fetch();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.reverse) {
              if (_isFabVisible) {
                setState(() {
                  _isFabVisible = false;
                });
              }
            } else if (notification.direction == ScrollDirection.forward) {
              if (!_isFabVisible) {
                setState(() {
                  _isFabVisible = true;
                });
              }
            }
          }
          return true;
        },
        child: Stack(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: CustomScrollView(
                controller: listController,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 350.0,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          ClipPath(
                            clipper: BottomCurvedClipper(),
                            child: Image.asset(
                              coverImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  translation(context).title_education_for_all,
                                  // 'Education for Everyone',
                                  style: GoogleFonts.poppins(
                                    color: kWhiteColor,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                FittedBox(
                                  child: Text(
                                    translation(context)
                                        .title_promote_rights_wellbeing,
                                    style: GoogleFonts.poppins(
                                        color: kWhiteColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sticky Search Bar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SearchBarDelegate(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomSearchField(
                          controller: searchController,
                          hintText: translation(context).search_here,
                          onChanged: (value) {
                            // Add search logic here
                          },
                        ),
                      ),
                    ),
                  ),
                  // Posts List
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < items.length) {
                          return _post(context, items[index]);
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: hasMore
                                  ? LoadingAnimationWidget.staggeredDotsWave(
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  : const Text("No more Posts to load"),
                            ),
                          );
                        }
                      },
                      childCount: items.length + 1,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 18,
              right: 16,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isFabVisible ? 1.0 : 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_isFabExpanded)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              translation(context).learn_your_rights,
                              // 'Learn Your Rights',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        const SizedBox(width: 12),
                        SpeedDial(
                          icon: null, // Set to null to use a custom icon widget
                          activeIcon: Icons.close, // Optional: toggled icon
                          backgroundColor: Colors.pinkAccent
                              .withOpacity(0.1), // Lighter color
                          elevation: 0,
                          overlayOpacity: 0.5,
                          overlayColor: Colors.black54,
                          iconTheme: const IconThemeData(color: Colors.white),

                          children: [
                            SpeedDialChild(
                              child: const Icon(
                                  Icons.content_paste_search_rounded),
                              label: translation(context).title_rights_of_child,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RightsOfTheChild(),
                                ),
                              ),
                            ),
                            SpeedDialChild(
                              child: const Icon(Icons.child_care_outlined),
                              label:
                                  translation(context).how_do_child_rights_help,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RightsHelpYou(),
                                ),
                              ),
                            ),
                            SpeedDialChild(
                              child: const Icon(Icons.question_mark),
                              label: translation(context).what_are_child_rights,

                              // 'What are Child Rights?',
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChildRights(),
                                ),
                              ),
                            ),
                          ],
                          child: Image.asset(
                            kRights,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // body: MediaQuery.removePadding(
      //   context: context,
      //   removeTop: true,
      //   child: CustomScrollView(
      //     controller: listController,
      //     slivers: [
      //       SliverAppBar(
      //         pinned: true,
      //         expandedHeight: 350.0,
      //         backgroundColor: Colors.white,
      //         flexibleSpace: FlexibleSpaceBar(
      //           background: Stack(
      //             children: [
      //               ClipPath(
      //                 clipper: BottomCurvedClipper(),
      //                 child: Image.asset(
      //                   coverImage,
      //                   fit: BoxFit.cover,
      //                   width: double.infinity,
      //                   height: double.infinity,
      //                 ),
      //               ),
      //               Center(
      //                 child: Column(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Text(
      //                       'Education for Everyone',
      //                       style: GoogleFonts.poppins(
      //                         color: kWhiteColor,
      //                         fontSize: 15,
      //                         // fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                     const SizedBox(height: 8),
      //                     FittedBox(
      //                       child: Text(
      //                         'Promoting the right and well being',
      //                         style: GoogleFonts.poppins(
      //                             color: kWhiteColor,
      //                             fontSize: 22,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),

      //       // Sticky Search Bar
      //       SliverPersistentHeader(
      //         pinned: true,
      //         delegate: _SearchBarDelegate(
      //           child: Padding(
      //             padding: const EdgeInsets.all(16.0),
      //             child: CustomSearchField(
      //               controller: searchController,
      //               hintText: translation(context).search_here,
      //               onChanged: (value) {
      //                 // Add search logic here
      //               },
      //             ),
      //           ),
      //         ),
      //       ),
      //       // Posts List
      //       SliverList(
      //         delegate: SliverChildBuilderDelegate(
      //           (context, index) {
      //             if (index < items.length) {
      //               return _post(context, items[index]);
      //             } else {
      //               return Padding(
      //                 padding: const EdgeInsets.all(16),
      //                 child: Center(
      //                   child: hasMore
      //                       ? LoadingAnimationWidget.staggeredDotsWave(
      //                           size: 20,
      //                           color: Colors.black,
      //                         )
      //                       : const Text("No more Posts to load"),
      //                 ),
      //               );
      //             }
      //           },
      //           childCount: items.length + 1,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Column _post(BuildContext context, PostListModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Visibility(
                      visible: item.featuredImage.isNotEmpty,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.network(
                          item.featuredImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          text: item.title,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullPostScreen(
                                    postId: item.id,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  translation(context).see_more,
                                  style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // PNG Decoration Below Card
              Positioned(
                bottom: 10,
                left: 350,
                right: 0,
                child: Image.network(
                  "https://kids.srilankaunites.org/wp-content/uploads/2024/11/paper-plane-1.png", // Update with your PNG path
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SearchBarDelegate({required this.child});

  @override
  double get minExtent => 70;
  @override
  double get maxExtent => 70;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      elevation: 4,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
