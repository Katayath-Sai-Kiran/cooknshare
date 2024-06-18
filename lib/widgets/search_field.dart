import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.textEditingController,
    required this.onSubmit,
  });

  final TextEditingController textEditingController;
  final Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(-10, -10),
                spreadRadius: 0,
                blurRadius: 10),
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(10, 10),
                spreadRadius: 0,
                blurRadius: 10)
          ]),
      child: TextFormField(
        cursorColor: Colors.amber,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
          ),
          border: customBorder,
          focusedBorder: customBorder,
          enabledBorder: customBorder,
          disabledBorder: customBorder,
        ),
      ),
    );
  }
}

OutlineInputBorder customBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.grey),
  borderRadius: BorderRadius.circular(12),
);
