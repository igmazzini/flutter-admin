import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/ui/cards/white_card.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard',style: CustomLabels.h1 ,),
          const SizedBox(height: 10,),
          WhiteCard(
            title: auth.user!.nombre,
            child:Text(auth.user!.correo)
          )
        ],
      ),
    );
  }
}