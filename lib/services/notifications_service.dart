import 'package:flutter/material.dart';

class NotificationService {


  static GlobalKey<ScaffoldMessengerState> notificationsKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError( String error ){

    final snackBar =  SnackBar(
      content: Text(error, style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.red.withOpacity(0.9),
    );

    notificationsKey.currentState!.showSnackBar(snackBar);

  }
  static showSnackBarSuccess( String msg ){

    final snackBar =  SnackBar(
      content: Text(msg, style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.green.withOpacity(0.9),
    );

    notificationsKey.currentState!.showSnackBar(snackBar);

  }


  static showWorking( BuildContext context){
    final AlertDialog dialog = AlertDialog(
      content:  Container(
        width: 100,
        height: 100,
        child: const  Center(child: CircularProgressIndicator()),
      ),
    );

    showDialog(context: context, builder: (_)=> dialog);
  }
  
}