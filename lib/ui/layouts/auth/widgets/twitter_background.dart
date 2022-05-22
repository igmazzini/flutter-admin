import 'package:flutter/material.dart';



class TwitterBackground extends StatelessWidget {
  
  const TwitterBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
    decoration: _buildBackground(),
    child: Container(
      constraints: const BoxConstraints(maxWidth:  400),       
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Image(
            image: AssetImage('twitter-white-logo.png')
            ),
          ),
      ),
    ),

     

      );
  }

  BoxDecoration _buildBackground() {
    return const BoxDecoration(
      image: DecorationImage(image: AssetImage('twitter-bg.png'), fit: BoxFit.cover),     
    );
  }
}