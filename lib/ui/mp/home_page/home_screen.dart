import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_list_model.dart';
import 'package:chilld_app/services/posts_service.dart';
import 'package:chilld_app/ui/mp/home_page/full_post_screen.dart';
import 'package:chilld_app/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    listController.addListener(() {
      if (listController.position.maxScrollExtent == listController.offset) {
        fetch();
      }
    });
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchField(
                controller: searchController,
                hintText:      translation(context).search_here,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Expanded(
                child: items.isEmpty
                    ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          size: 50,
                          color: Colors.black,
                        ),
                        // CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: refresh,
                        child: ListView.builder(
                          controller: listController,
                          itemCount: items.length + 1,
                          itemBuilder: (context, index) {
                            if (index < items.length) {
                              final item = items[index];
                              return _post(context, item);
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: Center(
                                  child: hasMore
                                      ? LoadingAnimationWidget
                                          .staggeredDotsWave(
                                          size: 20,
                                          color: Colors.black,
                                        )
                                      : const Text("No more Posts to load"),
                                ),
                              );
                            }
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _post(BuildContext context, PostListModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: item.title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
            // children: <TextSpan>[
            //   TextSpan(
            //     text: " Counts",
            //     style: GoogleFonts.poppins(
            //         color: kOrangeColor,
            //         fontSize: 24,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              children: [
                item.featuredImage.isNotEmpty
                    // item.featuredImage != ""
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          item.featuredImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          kPostImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              translation(context).see_more,
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
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
        ),
      ],
    );
  }
}
