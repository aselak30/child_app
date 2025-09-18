import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_details_model.dart';
import 'package:chilld_app/services/posts_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FullPostScreen extends StatefulWidget {
  final String postId;
  const FullPostScreen({super.key, required this.postId});

  @override
  State<FullPostScreen> createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  late Future<PostDetailsModel> postDetailsFuture;
  String? selectedLanguage = "english";
  // String? appLanguage = '';
  List<String> items = ['english', 'sinhala', "tamil"];

  @override
  void initState() {
    super.initState();
    postDetailsFuture = getPostDetails(widget.postId, selectedLanguage!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // get app language safely here
    String appLanguage = translation(context).localeName;

    setState(() {
      if (appLanguage == "en") {
        selectedLanguage = "english";
      } else if (appLanguage == "si") {
        selectedLanguage = "sinhala";
      } else if (appLanguage == "ta") {
        selectedLanguage = "tamil";
      } else {
        selectedLanguage = "english";
      }

      // now load post details with correct language
      postDetailsFuture = getPostDetails(widget.postId, selectedLanguage!);
    });
  }

  Future<PostDetailsModel> getPostDetails(
      String postId, String language) async {
    final postDetails =
        await PostsService.getPostDetails(context, language, postId);
    return postDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        surfaceTintColor: kWhiteColor,
        backgroundColor: kWhiteColor,
        foregroundColor: kWhiteColor,
        centerTitle: false,
        leadingWidth: 56,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: selectedLanguage, // Default value set to 'English'
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                color: kBlackColor,
              ),
              iconSize: 24,
              elevation: 16,
              style: GoogleFonts.openSans(
                color: kBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              // TextStyle(
              //     color: Colors.black,
              //     fontSize: 18),
              // underline: Container(
              //   height: 2,
              //   color: Colors.deepPurpleAccent,
              // ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  postDetailsFuture =
                      getPostDetails(widget.postId, selectedLanguage!);

                  // getPostDetails(widget.postId, selectedLanguage!);
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: FutureBuilder<PostDetailsModel>(
        future: postDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                size: 50,
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Image.asset(
              noData,
              height: 150,
              // width: double.infinity,
              fit: BoxFit.cover,
            ));
          } else if (snapshot.hasData) {
            final postDetails = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPadding,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   postDetails.translatedTitle,
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w600,
                    //     color: kBlackColor,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          // postDetails.featuredImage == false
                          //     ? Image.asset(
                          //         kPostImage,
                          //         height: 150,
                          //         width: double.infinity,
                          //         fit: BoxFit.cover,
                          //       )
                          //     :
                          //     Image.network(
                          //   postDetails.featuredImage,
                          //   height: 150,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          // ),
                          postDetails.featuredImage == true
                              ? Image.network(
                                  postDetails.featuredImage,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      postDetails.translatedTitle,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      postDetails.translatedContent,
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Image.asset(
              noData,
              height: 150,
              // width: double.infinity,
              fit: BoxFit.cover,
            ));
          }
        },
      ),
    );
  }
}
