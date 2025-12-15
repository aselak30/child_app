// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ContactsScreen extends StatefulWidget {
//   const ContactsScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ContactsScreenState createState() => _ContactsScreenState();
// }

// class _ContactsScreenState extends State<ContactsScreen> {
//   late final WebViewController controller;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize WebViewController
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Handle progress updates (optional)
//           },
//           onPageStarted: (String url) {
//             setState(() {
//               isLoading = true;
//             });
//           },
//           onPageFinished: (String url) {
//             setState(() {
//               isLoading = false;
//             });
//           },
//           onWebResourceError: (WebResourceError error) {},
//         ),
//       )
//       ..loadRequest(Uri.parse(
//           'https://keshangit.github.io/ncpa/')); // Replace with your Tidio script URL
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   title: const Text('Contacts'),
//       // ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             WebViewWidget(controller: controller),
//             if (isLoading)
//               const Center(
//                   child: CircularProgressIndicator()), // Show loading indicator
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'English'),
            Tab(text: 'සිංහල'),
            Tab(text: 'தமிழ்'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          WebViewTab(url: 'https://keshangit.github.io/ncpa/'),
          WebViewTab(url: 'https://keshangit.github.io/ncpa/sinhala'),
          WebViewTab(url: 'https://keshangit.github.io/ncpa/tamil'),
        ],
      ),
    );
  }
}

class WebViewTab extends StatefulWidget {
  final String url;

  const WebViewTab({super.key, required this.url});

  @override
  _WebViewTabState createState() => _WebViewTabState();
}

class _WebViewTabState extends State<WebViewTab>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Handle progress updates (optional)
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // Handle tel: and mailto: links
            if (request.url.startsWith('tel:') ||
                request.url.startsWith('mailto:')) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          },
        ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ContactsScreen extends StatefulWidget {
//   const ContactsScreen({super.key});

//   @override
//   _ContactsScreenState createState() => _ContactsScreenState();
// }

// class _ContactsScreenState extends State<ContactsScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Contacts'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const [
//             Tab(text: 'English'),
//             Tab(text: 'සිංහල'),
//             Tab(text: 'தமிழ்'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: const [
//           WebViewTab(url: 'https://keshangit.github.io/ncpa/'),
//           WebViewTab(url: 'https://keshangit.github.io/ncpa/sinhala'),
//           WebViewTab(url: 'https://keshangit.github.io/ncpa/tamil'),
//         ],
//       ),
//     );
//   }
// }

// class WebViewTab extends StatefulWidget {
//   final String url;

//   const WebViewTab({super.key, required this.url});

//   @override
//   _WebViewTabState createState() => _WebViewTabState();
// }

// class _WebViewTabState extends State<WebViewTab>
//     with AutomaticKeepAliveClientMixin {
//   late final WebViewController controller;
//   bool isLoading = true;

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize WebViewController
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.white)
//       ..enableZoom(false)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Handle progress updates (optional)
//           },
//           onPageStarted: (String url) {
//             if (mounted) {
//               setState(() {
//                 isLoading = true;
//               });
//             }
//           },
//           onPageFinished: (String url) {
//             if (mounted) {
//               setState(() {
//                 isLoading = false;
//               });
//             }
//           },
//           onWebResourceError: (WebResourceError error) {},
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Stack(
//       children: [
//         WebViewWidget(
//           controller: controller,
//           gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
//             Factory<VerticalDragGestureRecognizer>(
//               () => VerticalDragGestureRecognizer(),
//             ),
//           },
//         ),
//         if (isLoading)
//           const Center(
//             child: CircularProgressIndicator(),
//           ),
//       ],
//     );
//   }
// }
