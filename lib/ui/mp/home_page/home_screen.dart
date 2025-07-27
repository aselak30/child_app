import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_list_model.dart';
import 'package:chilld_app/services/posts_service.dart';
import 'package:chilld_app/ui/mp/home_page/full_post_screen.dart';
import 'package:chilld_app/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
    // listController.addListener(() {
    //   if (listController.position.maxScrollExtent == listController.offset) {
    //     fetch();
    //   }
    // });
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

    final newItems = await PostsService.getPosts(context, "english");

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
      page = 0;
      items.clear();
    });
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
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
                            'Education for Everyone',
                            style: GoogleFonts.poppins(
                              color: kWhiteColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          FittedBox(
                            child: Text(
                              'Promoting the right and well being',
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
    );

    // body: Padding(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: kHorizontalPadding,
    //     vertical: kVerticalPadding,
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CustomSearchField(
    //         controller: searchController,
    //         hintText: translation(context).search_here,
    //         onChanged: (value) {},
    //       ),
    //       const SizedBox(height: 16),
    //       Expanded(
    //         child: items.isEmpty
    //             ? Center(
    //                 child: LoadingAnimationWidget.staggeredDotsWave(
    //                   size: 50,
    //                   color: Colors.black,
    //                 ),
    //                 // CircularProgressIndicator(),
    //               )
    //             : RefreshIndicator(
    //                 onRefresh: refresh,
    //                 child: ListView.builder(
    //                   controller: listController,
    //                   itemCount: items.length + 1,
    //                   itemBuilder: (context, index) {
    //                     if (index < items.length) {
    //                       final item = items[index];
    //                       return _post(context, item);
    //                     } else {
    //                       return Padding(
    //                         padding:
    //                             const EdgeInsets.symmetric(vertical: 32),
    //                         child: Center(
    //                           child: hasMore
    //                               ? LoadingAnimationWidget
    //                                   .staggeredDotsWave(
    //                                   size: 20,
    //                                   color: Colors.black,
    //                                 )
    //                               : const Text("No more Posts to load"),
    //                         ),
    //                       );
    //                     }
    //                   },
    //                 ),
    //               ),
    //       ),
    //     ],
    //   ),
    // ),
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

  // Column _post(BuildContext context, PostListModel item) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 10, bottom: 10),
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           elevation: 4,
  //           child: Column(
  //             children: [
  //               // item.featuredImage.isNotEmpty
  //               //     ?
  //               Visibility(
  //                 visible: item.featuredImage.isNotEmpty,
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(15),
  //                   child: Image.network(
  //                     item.featuredImage,
  //                     height: 150,
  //                     width: double.infinity,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               // : ClipRRect(
  //               //     borderRadius: BorderRadius.circular(15),
  //               //     child: Image.asset(
  //               //       kPostImage,
  //               //       height: 150,
  //               //       width: double.infinity,
  //               //       fit: BoxFit.cover,
  //               //     ),
  //               //   ),
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: RichText(
  //                   text: TextSpan(
  //                     text: item.title,
  //                     style: GoogleFonts.poppins(
  //                       fontSize: 24,
  //                       fontWeight: FontWeight.w600,
  //                       color: kBlackColor,
  //                     ),
  //                     // children: <TextSpan>[
  //                     //   TextSpan(
  //                     //     text: " Counts",
  //                     //     style: GoogleFonts.poppins(
  //                     //         color: kOrangeColor,
  //                     //         fontSize: 24,
  //                     //         fontWeight: FontWeight.w600),
  //                     //   ),
  //                     // ],
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       item.description,
  //                       maxLines: 3,
  //                       overflow: TextOverflow.ellipsis,
  //                       style: GoogleFonts.poppins(fontSize: 16),
  //                     ),
  //                     const SizedBox(height: 8),
  //                     GestureDetector(
  //                       onTap: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => FullPostScreen(
  //                               postId: item.id,
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             translation(context).see_more,
  //                             style: GoogleFonts.poppins(
  //                               color: Colors.blue,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 5,
  //                           ),
  //                           const Icon(
  //                             Icons.arrow_forward_ios,
  //                             color: Colors.blue,
  //                             size: 15,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
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
