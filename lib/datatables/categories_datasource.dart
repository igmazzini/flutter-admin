import 'package:admin_dashboard_app/models/category.dart';
import 'package:admin_dashboard_app/providers/categories_provider.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/category_modal.dart';

class CategoriesDataSource extends DataTableSource{

  final List<Category> categories;
  final BuildContext context;

  CategoriesDataSource(this.categories, this.context);

  @override
  DataRow? getRow(int index) {
     
    Category category;

    if(index < categories.length){
      category = categories[index];
    }else{
      category = Category(id: '', nombre: '', usuario: Usuario(id:'',nombre: '') );
    }
    
    return DataRow.byIndex(
      index: index,
      cells:  [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell((category.id != '') ? 
        Row(children: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (_) => CategoryModal(category: category),backgroundColor: Colors.transparent);

          }, icon: const Icon(Icons.edit)),
          const SizedBox(width: 20,),
          IconButton(onPressed: (){
            final dialog = AlertDialog(
              title: Text('¿Eliminar la categoria: ${category.nombre}?'),
              actions: [
                TextButton(onPressed: (){ 
                  Navigator.of(context).pop();
                  }, 
                  child: const Text('No')),
                TextButton(onPressed: () async{
                   await Provider.of<CategoriesProvider>(context,listen: false).deleteCategory(category.id); 
                   NotificationService.showSnackBarSuccess('Categoria eliminada con exito');
                   Navigator.of(context).pop();
                },
                 child: const Text('Si, borrar')),
              ],
            );

            showDialog(context: context, builder: (_){
              return dialog;
            });
          },
           icon: const Icon(Icons.delete), color: Colors.red,),
        ],) 
        : const Text('')), 
       
      ]
    );
  }

  @override  
  bool get isRowCountApproximate => false;

  @override  
  int get rowCount => categories.length;

  @override  
  int get selectedRowCount => 0;
  
}