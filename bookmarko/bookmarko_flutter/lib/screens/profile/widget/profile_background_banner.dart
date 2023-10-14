import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class ProfileBackgroundBanner extends StatelessWidget {
  final VoidCallback onPressed;
  final bool hasBackgroundImage;
  // final ImageAsset backgroundImage;

  const ProfileBackgroundBanner({
    required this.onPressed,
    required this.hasBackgroundImage,
    // required this.backgroundImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          image: hasBackgroundImage
              ? const DecorationImage(
                  image: NetworkImage('backgroundImage.image_s3_id'),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage(
                    'assets/backgrounds/abstract_bookmarko_background_horizon.png',
                  ),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
