import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  final String msg;
  const MyText({super.key, required this.msg});

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.msg,
      overflow: TextOverflow.ellipsis,
    );
  }
}
