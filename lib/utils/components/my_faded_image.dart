import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MyFadedImage extends StatelessWidget {
  MyFadedImage({Key? key, required this.imageUrl, this.width, this.height, this.cacheWidth, this.cacheHeight, this.fit, this.placeholder, this.isCache = false, this.isProductList = false})
      : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  bool isCache;
  bool isProductList;
  final int? cacheHeight;
  final int? cacheWidth;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 50,
    //   width: 50,
    //   color: Colors.red,
    // );
    return isCache
        ? CachedNetworkImage(
            cacheKey: imageUrl,
            cacheManager: CacheManager(Config(
              'custom_key',
              stalePeriod: Duration(days: 1),
              maxNrOfCacheObjects: 200,
            )),
            key: UniqueKey(),
            imageUrl: imageUrl,
            fit: fit,
            width: width,
            height: height,
            memCacheWidth: cacheWidth,
            // memCacheHeight: cacheHeight,
            errorWidget: (context, url, error) =>
                placeholder ??
                Image.asset(
                  'images/logo.png',
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                  // cacheHeight: 270,
                  cacheWidth: 240,
                ),
          )
        //
        : FadeInImage.assetNetwork(
            placeholder: 'images/logo.png', //'images/image_coming_soon.png',
            placeholderFit: BoxFit.contain,
            image: imageUrl,
            width: width,
            height: height,
            // imageCacheHeight: isProductList ? 540 : cacheHeight,
            imageCacheWidth: isProductList ? 591 : cacheWidth,
            placeholderCacheHeight: 270,
            placeholderCacheWidth: 240,
            fit: fit,
            imageErrorBuilder: (context, exception, stackTrace) {
              return placeholder ??
                  Image.asset(
                    'images/logo.png',
                    width: width,
                    height: height,
                    fit: BoxFit.contain,
                    // cacheHeight: 270,
                    cacheWidth: 240,
                  );
            },
          );
  }
}
