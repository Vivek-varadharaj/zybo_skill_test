import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool isNotification;
  final String placeholder;
  const CustomImage(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.isNotification = false,
      this.placeholder = ''});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => placeholder.isNotEmpty
          ? Image.asset(placeholder, height: height, width: width, fit: fit)
          : Container(),
      errorWidget: (context, url, error) => placeholder.isNotEmpty
          ? Image.asset(placeholder, height: height, width: width, fit: fit)
          : Container(),
    );
  }
}
