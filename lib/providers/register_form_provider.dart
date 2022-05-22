import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String  name = '';
  String  password = '';

  validateForm(){
     if(formKey.currentState!.validate()){
       return true;
     }else{
       return false;
     } 
  }
  
}