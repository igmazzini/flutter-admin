

import 'dart:typed_data';

import 'package:admin_dashboard_app/api/cafe_api.dart';
import 'package:admin_dashboard_app/models/http/users_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/usuario.dart';

class UsersProvider extends ChangeNotifier {

  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;


  UsersProvider(){
    getPaginatedUsers();
  }



  getPaginatedUsers() async{

    final resp = await CafeApi.httpGet('/usuarios?limite=20&desde=0');

    final data = UsersResponse.fromMap(resp);

    users = data.usuarios;

    isLoading = false;

    notifyListeners();

  }


  Future<Usuario?> getUserById(id) async {

    try {

      final resp = await CafeApi.httpGet('/usuarios/$id');

      final user = Usuario.fromMap(resp);  

      return user;
      
    } catch (e) {

      return null;

    }

   

  }

   Future<bool> updateUser(Usuario user) async {    

     final data = {
       'nombre':user.nombre,
       'correo':user.correo
     };

      try {

        final resp = await CafeApi.httpPut('/usuarios/${user.uid}', data);
        final updatedUser =  Usuario.fromMap(resp);

      


        users = users.map(
          (u){
            if(u.uid == updatedUser.uid){
             u = updatedUser;
            }
            return u;
          }
        ).toList();

        notifyListeners();

        return true;
        
      } on DioError catch (e) {

        throw e;
       
      }

      
   }

  Future<Usuario> uploadImage( String path, Uint8List bytes, String userId ) async {
    try {

       final resp = await CafeApi.httpUploadFile(path, bytes);

       final updatedUser = Usuario.fromMap(resp);

       users = users.map(
          (u){
            if(u.uid == userId){
             u =  updatedUser;
            }
            return u;
          }
        ).toList();

        notifyListeners();

        return updatedUser;

    } on DioError catch (e) {

        throw e;
       
      }
  } 


  void sort<T>( Comparable<T> Function(Usuario user) getField ) {

    users.sort( ( a, b ) {

      final aValue = getField( a );
      final bValue = getField( b );

      return ascending
       ? Comparable.compare(aValue, bValue)
       : Comparable.compare(bValue, aValue);

    });


    ascending = !ascending;


    notifyListeners();

  }

  
}