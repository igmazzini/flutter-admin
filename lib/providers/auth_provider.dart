import 'package:admin_dashboard_app/api/cafe_api.dart';
import 'package:admin_dashboard_app/models/http/auth_reponse.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/services/local_storage.dart';
import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';


enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}


class AuthProvider extends ChangeNotifier {


  String? _token;
  Usuario? user;
  AuthStatus authStatus = AuthStatus.checking;


  AuthProvider(){
    isAuthenticated();
  }

  login(String email, String password){

    final data = {    
      'correo':email,
      'password':password,
    };


    CafeApi.httpPost('/auth/login',data)
    .then((json) {

       
        final authResponse = AuthResponse.fromMap(json);
        user = authResponse.usuario;
        authStatus = AuthStatus.authenticated;

        LocalStorage.prefs.setString('token',authResponse.token);    

        CafeApi.configureDio();

        NavigationService.replaceTo(Flurorouter.dashboardRoute);
        
        notifyListeners();



    })
    .catchError((e) {
      authStatus = AuthStatus.notAuthenticated;
      NotificationService.showSnackBarError('Error de autenticación');
    
    });

   
  }


  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');
    if(token == null){
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Comprobar token con el backend

    try {

      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token',authResponse.token);     

      //CafeApi.configureDio();

      
      notifyListeners();  

      return true;

      
    } catch (e) {

      authStatus = AuthStatus.notAuthenticated;
   
      notifyListeners();  

      return false;

    } 


    
    

   

    
  }

  register(String name,String email, String password) async {
   

    final data = {
      'nombre':name,
      'correo':email,
      'password':password,
    };


    CafeApi.httpPost('/usuarios',data)
    .then((json) {

        
        final authResponse = AuthResponse.fromMap(json);
        user = authResponse.usuario;
        authStatus = AuthStatus.authenticated;

        LocalStorage.prefs.setString('token',authResponse.token);       

        CafeApi.configureDio();


        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        notifyListeners();



    })
    .catchError((e) {
      authStatus = AuthStatus.notAuthenticated;
      NotificationService.showSnackBarError('Error en registro');
     
    });
  
    return true;
  }


  logout(){

    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.loginRoute);
    notifyListeners();

  }
  
}