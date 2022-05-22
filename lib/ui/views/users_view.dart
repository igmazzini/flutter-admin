import 'package:admin_dashboard_app/datatables/users_datasource.dart';
import 'package:admin_dashboard_app/providers/users_provider.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   

    final usersProvider = Provider.of<UsersProvider>(context);

    final usersDataSource  = UsersDataSource(usersProvider.users);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Users',style: CustomLabels.h1 ,),
          const SizedBox(height: 10,),
          PaginatedDataTable(
            source: usersDataSource,
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns:  [
                const DataColumn(label: Text('Avatar')),
                DataColumn(label: const Text('Nombre'),onSort: (i,_){   
                  usersProvider.sortColumnIndex = i;              
                  usersProvider.sort<String>((user) => user.nombre);
                }),
                DataColumn(label: const Text('Email'),onSort: (i,_){    
                  usersProvider.sortColumnIndex = i;              
                  usersProvider.sort<String>((user) => user.correo);
                }),
                const DataColumn(label: Text('UID')),
                const DataColumn(label: Text('Acciones')),
            ],
            onPageChanged: ( page ){

            },
           
            )
        ],
      ),
    );
  }
}