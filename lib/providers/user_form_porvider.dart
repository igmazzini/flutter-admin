
import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UserFormProvider extends ChangeNotifier{


  Usuario? user;
  late GlobalKey<FormState>  formKey;



  copyUserWith(
    {String?  rol,
    bool?  estado,
    bool?  google,
    String?  nombre,
    String?  correo,
    String?  uid,
    String?  img}
  ){

    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img
      
      );

    notifyListeners();
  }

  bool validForm(){
    if(formKey.currentState!.validate()){
      return true;
    }else{
      return false;
    }

  }  
  
}