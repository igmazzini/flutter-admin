import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {

  final String title;
  final Widget child;
  final double? width;
  final double? height;

  const WhiteCard({Key? key, required this.title, required this.child, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: _buildDecoration(),
      width: width ?? null,
      height: height ?? null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(child: Text(title, style: GoogleFonts.roboto(fontSize:15,fontWeight:FontWeight.bold)),fit: BoxFit.contain),
          const Divider(),
          child
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );
}