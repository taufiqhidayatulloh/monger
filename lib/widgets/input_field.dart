import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyInputField extends StatelessWidget {
  final String label;
  final String hint;
  bool obscureText = false;
  Function(String)? onChanged;
  final TextEditingController? controller;

  MyInputField({
    super.key,
    required this.obscureText,
    required this.label,
    required this.hint,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.shadow)),
      const SizedBox(
        height: 8,
      ),
      TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          hintText: hint,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
              fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .shadow
                  .withOpacity(0.3), // Warna border
              width: 2.0, // Ketebalan border
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .shadow
                  .withOpacity(0.3), // Warna border ketika focused
              width: 2.0,
            ),
          ),
          filled: true, // Menambahkan warna background
          fillColor: Colors.white,
          // suffix: obscureText
          //     ? IconButton(
          //         onPressed: () {
          //           // setState(() {
          //           //   obscureText = false;
          //           // });
          //         },
          //         icon: Icon(Icons.remove_red_eye))
          //     : null,
        ),
      ),
    ]);
  }
}
