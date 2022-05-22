import 'package:admin_dashboard_app/datatables/categories_datasource.dart';
import 'package:admin_dashboard_app/modals/category_modal.dart';
import 'package:admin_dashboard_app/providers/categories_provider.dart';
import 'package:admin_dashboard_app/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;


  @override
  void initState() {    
    super.initState();

    Provider.of<CategoriesProvider>(context,listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    final size = MediaQuery.of(context).size;
    
    return Container(
      padding:  EdgeInsets.only(left: (size.width > 700 ) ? 20 : 0, right: (size.width > 700 ) ? 20 : 0, top: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories',style: CustomLabels.h1 ,),
          const SizedBox(height: 10,),
          PaginatedDataTable(
              columns: const[ 
              DataColumn(label: Text('ID'),tooltip: 'Id de categoria'),
              DataColumn(label: Text('Categoria'),tooltip: 'Nombre de catergoria'),
              DataColumn(label: Text('Creado por'),tooltip: 'Creador de catergoria'),
              DataColumn(label: Text('Acciones')),
              
              ],
              source: CategoriesDataSource(categoriesProvider.categories,context),
              header: const Text('Categorias disponibles', maxLines: 2,),
              rowsPerPage: _rowsPerPage,             
              onRowsPerPageChanged: (value){
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              actions: [
                CustomIconButton(onPressed: (){

                  showModalBottomSheet(context: context, builder: (_) => const CategoryModal(),backgroundColor: Colors.transparent);

                }, text: 'Nuevo',icon: Icons.add,),
                CustomIconButton(onPressed: (){

                }, text: 'Borrar todo',icon: Icons.delete_outline,color: Colors.red,),
                
              ],
            )
        ],
      ),
    );
  }
}