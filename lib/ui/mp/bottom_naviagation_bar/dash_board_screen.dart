import 'package:chilld_app/constants.dart';
import 'package:chilld_app/ui/mp/chat_screen/chat_screen.dart';
import 'package:chilld_app/ui/mp/home_page/home_screen.dart';
import 'package:chilld_app/ui/mp/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: kWhiteColor,
        color: kWhiteColor,
        shadowColor: kGrayColor,
        elevation: 3,
        height: 70,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kHomeIcon,
                      width: 20,
                      color: _currentIndex == 0
                          ? kPrimaryBlueColor
                          : kPrimaryBlueColor.withOpacity(0.5),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        color: _currentIndex == 0
                            ? kBlackColor
                            : kGrayColor.withOpacity(0.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kChatIcon,
                      width: 20,
                      color: _currentIndex == 1
                          ? kPrimaryBlueColor
                          : kPrimaryBlueColor.withOpacity(0.5),
                    ),
                    Text(
                      'Chat',
                      style: GoogleFonts.poppins(
                        color: _currentIndex == 1
                            ? kBlackColor
                            : kGrayColor.withOpacity(0.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      kProfileIcon,
                      width: 20,
                      color: _currentIndex == 2
                          ? kPrimaryBlueColor
                          : kPrimaryBlueColor.withOpacity(0.5),
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        color: _currentIndex == 2
                            ? kBlackColor
                            : kGrayColor.withOpacity(0.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
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
