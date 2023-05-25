import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({Key? key, required this.articleUrl}) : super(key: key);

  final String articleUrl;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  SnackBar errorSnackBar = const SnackBar(
    content: Text("Error loading webpage"),
    duration: Duration(milliseconds: 500),
  );

  var webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.loadRequest(Uri.parse(widget.articleUrl));
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onWebResourceError:(error) {
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          Navigator.pop(context);
        },
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    webViewController.clearCache();
    webViewController.clearLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              " News", // space between two words
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: WebViewWidget(controller: webViewController,),
      ),
    );
  }
}
