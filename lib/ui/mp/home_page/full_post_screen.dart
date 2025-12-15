import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_details_model.dart';
import 'package:chilld_app/services/posts_service.dart';
import 'package:chilld_app/ui/mp/full_screen_vedio_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullPostScreen extends StatefulWidget {
  final String postId;
  const FullPostScreen({super.key, required this.postId});

  @override
  State<FullPostScreen> createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  late Future<PostDetailsModel> postDetailsFuture;
  String? selectedLanguage = "english";
  List<String> items = ['english', 'sinhala', "tamil"];
  YoutubePlayerController? _youtubeController;
  String? _currentVideoId;

  @override
  void initState() {
    super.initState();
    postDetailsFuture = getPostDetails(widget.postId, selectedLanguage!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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

      postDetailsFuture = getPostDetails(widget.postId, selectedLanguage!);
    });
  }

  Future<PostDetailsModel> getPostDetails(
      String postId, String language) async {
    final postDetails =
        await PostsService.getPostDetails(context, language, postId);

    if (postDetails.type == "video" && postDetails.video != null) {
      _initializeYoutubePlayer(postDetails.video!);
    }

    return postDetails;
  }

  void _initializeYoutubePlayer(String videoUrl) {
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId == null) return;

    // Only recreate if video ID changed
    if (_currentVideoId != videoId) {
      _youtubeController?.dispose();
      _currentVideoId = videoId;

      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
          controlsVisibleAtStart: true,
          hideControls: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  // ✅ Open fullscreen with video ID only
  void _openFullscreen() {
    if (_currentVideoId == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPage(
          videoId: _currentVideoId!, // ✅ Pass only video ID
        ),
      ),
    );
  }

  Widget buildYoutubePlayer() {
    if (_youtubeController == null) return const SizedBox.shrink();

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: YoutubePlayer(
        controller: _youtubeController!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
        bottomActions: [
          const CurrentPosition(),
          const ProgressBar(isExpanded: true),
          const RemainingDuration(),
          IconButton(
            icon: const Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
            onPressed: _openFullscreen,
          ),
        ],
      ),
    );
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
              value: selectedLanguage,
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
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  postDetailsFuture =
                      getPostDetails(widget.postId, selectedLanguage!);
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
                    if (postDetails.type == "video" &&
                        postDetails.video != null &&
                        _youtubeController != null)
                      buildYoutubePlayer()
                    else if (postDetails.featuredImage == true)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          postDetails.featuredImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
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
              fit: BoxFit.cover,
            ));
          }
        },
      ),
    );
  }
}
