

import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';


class UsersDataSource extends DataTableSource {



  List<Usuario> users;

  UsersDataSource( this.users );


  @override
  DataRow? getRow(int index) {

    Usuario user;

    if(index < users.length){
      user = users[index];
    }else{
      user = Usuario(correo: '', estado: false, google: false, nombre: '', rol: '', uid: '' );
    }


   final image = (user.img == null)
          ? const ClipOval(child: Image(image: AssetImage('no-image.jpg'),width: 35, height: 35,))
          : ClipOval(child: FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!,width: 35, height: 35,));
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(image),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          IconButton(
           icon: const Icon(Icons.edit_outlined),
            onPressed: (){
              NavigationService.replaceTo('user/${user.uid}');
            },)
        ),
       
      ]
    );   
  }

  @override 
  bool get isRowCountApproximate => false;

  @override  
  int get rowCount => users.length;

  @override 
  int get selectedRowCount => 0;
  
}