import 'package:flutter/material.dart';

import '../app_utils/contestants.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String val) onChang;
  const SearchWidget(
      {Key? key, required this.controller, required this.onChang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: TextFormField(
        onChanged: onChang,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          filled: true,
          fillColor: greyColr.withOpacity(0.2),
          hintText: "Search...",
          hintStyle: const TextStyle(fontSize: 16.0),
          prefixIcon: const Icon(
            Icons.search,
            size: 28.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
