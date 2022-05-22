import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const Icon(Icons.notifications),
          Positioned(
            top: 0,
            right: 3,
            child: Container(
              width: 5,
              height: 5,
             /*  child: Center(child: Text('44',style: GoogleFonts.roboto(fontSize:9, color:Colors.white))), */
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          )
        ],
      ),
    );
  }
}