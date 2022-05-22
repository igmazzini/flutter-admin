import 'package:admin_dashboard_app/models/category.dart';
import 'package:admin_dashboard_app/providers/categories_provider.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:admin_dashboard_app/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_app/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryModal extends StatefulWidget {


  final Category? category;


  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {

  String name = '';
  String? id;



  @override
  void initState() {
       
    super.initState();

    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {

    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: builDecoration(),
      child: Column(       
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.category?.nombre ?? 'Nueva categoria',style: CustomLabels.h1.copyWith(color: Colors.white),),
              IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                 },
                icon: const Icon(Icons.close_rounded, color: Colors.white,size: 35,)
                ),
                
            ],
        ),
        Divider(color:Colors.white.withOpacity(0.3)),
        const SizedBox(height: 20,),
        TextFormField(
          initialValue: widget.category?.nombre ?? '',
          onChanged: (val) => name = val,
          style: const TextStyle(color: Colors.white),
          decoration: CustomInputs.loginInputDecoration(hint: 'Nombre de la categoria', label: 'Categoria', icon: Icons.new_releases_outlined)
        ),
        Container(
          margin: const EdgeInsets.only(top:30),
          alignment: Alignment.center,
          child: CustomOutlinedButton(
            onPressed: () async{

              if(id == null){

                await categoriesProvider.createCategory(name);
                NotificationService.showSnackBarSuccess('Categoria creada con exito');
                 
              }else{
               
                await categoriesProvider.updateCategory(id!, name);
                NotificationService.showSnackBarSuccess('Categoria actualizada con exito');
              }

              Navigator.of(context).pop();
             
            },
            text: 'Guardar',
            textColor: Colors.white,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  BoxDecoration builDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color(0xff0F2041),
    boxShadow: [
      BoxShadow(color: Colors.black26,)
    ]
  );
}