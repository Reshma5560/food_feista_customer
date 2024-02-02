// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/utils.dart';
import '../app_assets.dart';
import '../app_colors.dart';
import '../app_loader.dart';
import 'icon_button.dart';

class MyWebView extends StatefulWidget {
  final String webURL;
  final String? title;
  final Widget? myWidget;

  const MyWebView({
    super.key,
    required this.webURL,
    this.title,
    this.myWidget,
  });

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController controller;
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isLoading.value = false;
          },
          onUrlChange: (UrlChange change) {},
          onWebResourceError: (WebResourceError error) {
            isLoading.value = false;
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.webURL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isValEmpty(widget.title)
          ? AppBar(
              centerTitle: false,
              leading: MFIconButton(
                onTap: () => Get.back(),
                // ignore: deprecated_member_use
                icon: SvgPicture.asset(AppAssets.backArrowIcon,
                    color: AppColors.white),
              ),
              title: Text(widget.title ?? ""),
            )
          : null,
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: isLoading.isFalse
              ? WebViewWidget(
                  controller: controller,
                )
              : CircularLoader(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
