import 'package:admin_dashboard_app/api/cafe_api.dart';
import 'package:admin_dashboard_app/models/category.dart';
import 'package:admin_dashboard_app/models/http/categories_response.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {

  List<Category> categories = [];

  getCategories() async {

    final resp = await CafeApi.httpGet('/categorias');

    final data = CategoriesResponse.fromMap(resp);

    categories = data.categories;    

    notifyListeners();

  }


  Future createCategory( String name ) async {

    final data = {
      'nombre':name
    };

    try {

      final resp = await CafeApi.httpPost('/categorias', data);

      final category = Category.fromMap(resp);

      categories.add(category);

      notifyListeners();  

    } catch (e) {

     //print('createCategory: $e');
      NotificationService.showSnackBarError('Error al crear categoria');
    }

  }

  Future updateCategory( String id, String name ) async {

    

    final data = {
      'nombre':name
    };

    try {

      await CafeApi.httpPut('/categorias/$id', data);     

      final findCat =  categories.firstWhere((cat) => cat.id == id);

      findCat.nombre = name;     

      notifyListeners();  

    } catch (e) {

      //print('updateCategory: $e');
      NotificationService.showSnackBarError('Error al actualizar categoria');
    }

  }


  Future deleteCategory( String id) async {    

    try {

      await CafeApi.httpDelete('/categorias/$id');     

      categories.removeWhere((cat) => cat.id == id);    
        

      notifyListeners();  

    } catch (e) {

      //print('updateCategory: $e');
      NotificationService.showSnackBarError('Error al borrar categoria');
    }

  }
  
}