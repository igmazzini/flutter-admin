

import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/providers/menu_provider.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/text_separator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);


  


  void navigateTo(String routeName) {
     NavigationService.replaceTo(routeName);
     MenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final menuProvider = Provider.of<MenuProvider>(context);
    final auth = Provider.of<AuthProvider>(context);
    
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50,),
          const TextSeparator(text:'Main'),
          MenuItem(
            text:'Dashboard',
            icon:Icons.dashboard_outlined,
            isActive:(menuProvider.currentPage == Flurorouter.dashboardRoute ) ? true : false,
            onPressed:() => navigateTo(Flurorouter.dashboardRoute)
          ),
          MenuItem(
            text:'Orders',
            icon:Icons.shopping_cart_outlined,
            isActive: (menuProvider.currentPage == Flurorouter.ordersRoute ) ? true : false,
            onPressed:() => navigateTo(Flurorouter.ordersRoute)
            
          ),
          MenuItem(
            text:'Analytic',
            icon:Icons.show_chart_outlined,
            isActive:(menuProvider.currentPage == Flurorouter.loginRoute ) ? true : false,
            onPressed:(){
              print('Dasboard');
            }
          ),
          MenuItem(
            text:'Categories',
            icon:Icons.layers_outlined,
            isActive:(menuProvider.currentPage == Flurorouter.categoriesRoute ) ? true : false,
            onPressed:() => navigateTo(Flurorouter.categoriesRoute)
          ),
          MenuItem(
            text:'Products',
            icon:Icons.production_quantity_limits,
            isActive:false,
            onPressed:(){
              print('Dasboard');
            }
          ),
          MenuItem(
            text:'Users',
            icon:Icons.people_alt_outlined,
            isActive:(menuProvider.currentPage == Flurorouter.usersRoute ) ? true : false,
            onPressed:() => navigateTo(Flurorouter.usersRoute)
          ),

          const SizedBox(height: 30,),
          const TextSeparator(text:'UI Elements'),
          MenuItem(
            text:'Profile',
            icon:Icons.verified_user_outlined,
            isActive:false,
            onPressed:(){
              print('Dasboard');
            }
          ),
          MenuItem(
            text:'Logout',
            icon:Icons.logout_outlined,
            isActive:false,
            onPressed:(){
              print('Logout');
              auth.logout();
            }
          ),
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors:  [
          Color(0xff092044),
          Color(0xff092042),
        ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10
          )
        ]
    );
  }
}