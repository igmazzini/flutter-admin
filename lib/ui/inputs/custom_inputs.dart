import 'package:flutter/material.dart';

class CustomInputs {

  static InputDecoration loginInputDecoration({
      required String hint,
      required String label,
      required IconData icon,
    })
    
    {
    return InputDecoration(
      hintText: hint,
      label: Text(label),
      suffixIcon: Icon(icon, color: Colors.white.withOpacity(0.5),),   
      labelStyle: TextStyle(color:Colors.white.withOpacity(0.5)),
      hintStyle: TextStyle(color:Colors.white.withOpacity(0.5)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)
      )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)
      )),
        

                  
    );
  }


  static InputDecoration searchInputDecoration({ required String hint, required IconData icon}){
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color:Colors.grey),
      hintStyle: const TextStyle(color:Colors.grey),
    );
  }


   static InputDecoration userFormInputDecoration({
      required String hint,
      required String label,
      required IconData icon,
    })
    
    {
    return InputDecoration(
      hintText: hint,
      label: Text(label),
      suffixIcon: Icon(icon, color: Colors.indigo.withOpacity(0.5),),   
      labelStyle: TextStyle(color:Colors.indigo.withOpacity(0.5)),
      hintStyle: TextStyle(color:Colors.indigo.withOpacity(0.5)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.5)
      )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.5)
      )),
       

                  
    );
  }
  
}