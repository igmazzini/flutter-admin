import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {


  final String text;
  final Function()? onTap;

  const LinkText({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {


  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(widget.text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,      
            decoration: (isHover) ? TextDecoration.underline : TextDecoration.none
          ),),
        ),
      ),
    );
  }
}