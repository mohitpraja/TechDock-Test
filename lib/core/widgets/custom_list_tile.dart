import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/fonts.dart';
import 'package:tech_dock_test/core/theme/icons.dart';

class CustomListTile extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onFavPressed;
  final SearchResultList data;
  const CustomListTile({
    super.key,
    this.onTap,
    this.onFavPressed,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: data.image ?? '',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            data.title ?? '',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FF.lato,
              color: grey,
            ),
          )),
          IconButton(
              onPressed: onFavPressed,
              icon: data.isFavourite == true
                  ? AppIcons.heartFillIcon
                  : AppIcons.heartIcon)
        ],
      ),
    );
  }
}
