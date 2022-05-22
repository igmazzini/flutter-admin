import 'package:flutter/material.dart';


class CustomIconButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.text,   
    required this.icon,
    this.color = Colors.blue,
    this.isFilled = false,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color),
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.3)),
      ),
      onPressed: ()=> onPressed(),
      child: Row(
        children: [         
          Text(text,style: const TextStyle(color:Colors.white)),
          const SizedBox(width: 5,),
          Icon(icon, color:Colors.white),
        ],
      )
      );
  }
}