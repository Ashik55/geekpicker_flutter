import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageComponenet extends StatelessWidget {
  String? imageUrl;

  NetworkImageComponenet({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$imageUrl",
      fit: BoxFit.cover,
      placeholder: (context, url) => PlaceholderImage(),
      errorWidget: (context, url, error) => PlaceholderImage(),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/user.png',
      fit: BoxFit.cover,
    );
  }
}
