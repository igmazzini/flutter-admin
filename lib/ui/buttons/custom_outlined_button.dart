import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {

  final Function? onPressed;
  final String text;
  final Color textColor;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton({Key? key, this.onPressed, required this.text, this.color = Colors.blue, this.isFilled = false, this.textColor = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: color)
        ),
        backgroundColor: MaterialStateProperty.all(
          isFilled ? color.withOpacity(0.4) : Colors.transparent
        )
      ),
      onPressed: () {
        if( onPressed != null ) {
          onPressed!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: textColor
          ),
          
          ),
      ),
      

      
      );
  }
}