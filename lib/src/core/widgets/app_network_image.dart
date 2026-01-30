import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/utils/constants.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    this.height,
    this.width,
    this.fit,
    this.imageURL,
    this.isLisTile,
    this.borderRadius,
  });
  final String? imageURL;
  final double? width, height;
  final BoxFit? fit;
  final bool? isLisTile;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    print('Image File :: ${imageURL?.length}');
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
      child: CachedNetworkImage(
        imageUrl: imageURL != null && imageURL != 'null' && imageURL != ''
            ? '$imageURL'
            : sampleImage,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        // httpHeaders: {'cookie': cookiesSid},
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: isLisTile == true
                ? LinearProgressIndicator(value: downloadProgress.progress)
                : CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) =>
            const Icon(Icons.account_box_outlined),
      ),
    );
  }
}
