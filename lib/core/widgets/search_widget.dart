import 'package:flutter/material.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/icons.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final void Function(String)? onSubmitted;

  const SearchWidget({
    super.key,
    this.textEditingController,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: grey,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search recipe',
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey.withOpacity(0.3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey.withOpacity(0.4))),
          prefixIcon:AppIcons.searchIcon,
        ),
        controller: textEditingController,
        onSubmitted: onSubmitted);
  }
}
