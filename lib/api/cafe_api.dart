import 'dart:typed_data';

import 'package:admin_dashboard_app/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {

  static final Dio _dio =  Dio();

  static void configureDio(){

    //Base url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    //Headers
    _dio.options.headers = {
      'x-token':LocalStorage.prefs.getString('token') ?? ''
    };

  }

  static Future httpGet( String path ) async {

    
    try {

      final resp = await _dio.get(path);   

      return resp.data;
      
    } on DioError catch (e) {
      throw('Error en el GET ${e.response}'); 
    }
  }

  static Future httpPost( String path,Map<String,dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {

      final resp = await _dio.post(path,data:formData);

      return resp.data;
      
    } on DioError  catch (e) {
  
      throw('Error en el POST ${e.response}'); 
     
    }
  }

  static Future httpPut( String path,Map<String,dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {

      final resp = await _dio.put(path,data:formData);

      return resp.data;
      
    } on DioError catch (e) {
  
      throw('Error en el PUT ${e.response}'); 
     
    }
  }
  static Future httpUploadFile( String path, Uint8List bytes ) async {

    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes)
    });

    try {

      final resp = await _dio.put(path,data:formData);

      return resp.data;
      
    } on DioError catch (e) {
  
      throw('Error en UploadFile  ${e.response}'); 
     
    }
  }
  static Future httpDelete( String path ) async {   

    try {

      final resp = await _dio.delete(path);

      return resp.data;
      
    } on DioError catch (e) {
  
      throw('Error en el DELETE ${e.response}'); 
     
    }
  }
  
  
}