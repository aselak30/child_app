import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullPostScreen extends StatefulWidget {
  const FullPostScreen({super.key});

  @override
  State<FullPostScreen> createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
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
            child: Row(
              children: [
                Text(
                  'English',
                  style: GoogleFonts.openSans(
                    color: kBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: kBlackColor,
                  ),
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kindness Counts",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  kPostImage,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Arcu sed sapien magna hac amet. Ultricies neque congue felis phasellus velit felis dui. Mollis turpis euismod risus nunc est scelerisque.'
                      'Nunc pharetra convallis duis adipiscing ultricies nec vel pretium. Adipiscing blandit sed aenean suscipit convallis velit donec hendrerit facilisi. Praesent in commodo id tortor. Duis malesuada pellentesque odio mattis ut morbi tortor pellentesque. Molestie auctor elit vitae congue. Est nunc sem nulla morbi convallis.'
                      ' Sem magna erat varius vel. Integer vulputate donec euismod in. Pellentesque commodo dolor duis ornare odio id. Enim tortor mi diam magna neque duis morbi erat. Nisi purus urna aliquam sed. Quisque aenean facilisi tristique felis sit eget ac dignissim.'
                      'Nisi morbi vulputate ipsum magna facilisis pellentesque tristique nam at. Faucibus malesuada amet mi aliquet diam nisl morbi. Fames eu suspendisse nisl faucibus.'
                      'Nisi morbi vulputate ipsum magna facilisis pellentesque tristique nam at. Faucibus malesuada amet mi aliquet diam nisl morbi. Fames eu suspendisse nisl faucibus.',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
