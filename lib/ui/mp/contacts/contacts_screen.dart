import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Handle progress updates (optional)
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(
          'https://keshangit.github.io/ncpa/')); // Replace with your Tidio script URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Contacts'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (isLoading)
              const Center(
                  child: CircularProgressIndicator()), // Show loading indicator
          ],
        ),
      ),
    );
  }
}
