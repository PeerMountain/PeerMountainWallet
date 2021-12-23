import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/generated/assets.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;

  final BoxFit fit;
  final String placeholder;
  final bool isLocal;

  final String noImageAvailable = "https://www.esm.rochester.edu/uploads/NoPhotoAvailable.jpg";

  final BorderRadius? borderRadius;

  const CachedImage(
    this.imageUrl, {
    Key? key,
    this.isRound = true,
    this.radius = 50.0,
    this.isLocal = false,
    this.height = 50.0,
    this.width = 50.0,
    this.fit = BoxFit.cover,
    this.placeholder = Assets.imagesSuccess,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      if (isLocal) {
        return Container(
          height: isRound ? radius : height,
          width: isRound ? radius : width,
          decoration: BoxDecoration(
            shape: isRound ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(placeholder),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipOval(
            child: Image.file(
              File(imageUrl!),
              fit: fit,
              height: isRound ? radius : height,
              width: isRound ? radius : width,
            ),
          ),
        );
      }

      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? "",
          fit: fit,
          height: isRound ? radius : height,
          width: isRound ? radius : width,
          fadeInDuration: const Duration(milliseconds: 200),
          placeholder: (context, url) => Container(
            height: isRound ? radius : height,
            width: isRound ? radius : width,
            decoration: BoxDecoration(
              shape: isRound ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: !isRound ? borderRadius ?? BorderRadius.circular(5) : null,
              image: DecorationImage(
                image: AssetImage(placeholder),
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: isRound ? radius : height,
            width: isRound ? radius : width,
            decoration: BoxDecoration(
              shape: isRound ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: !isRound ? borderRadius ?? BorderRadius.circular(5) : null,
              image: DecorationImage(
                image: AssetImage(placeholder),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      return ClipRRect(
        borderRadius: !isRound ? borderRadius ?? BorderRadius.circular(5) : null,
        child: ClipOval(
          child: Image.network(
            noImageAvailable,
            height: isRound ? radius : height,
            width: isRound ? radius : width,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
