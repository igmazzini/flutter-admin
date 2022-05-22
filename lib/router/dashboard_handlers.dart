
import 'package:admin_dashboard_app/providers/menu_provider.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/ui/views/categories_view.dart';
import 'package:admin_dashboard_app/ui/views/login_view.dart';
import 'package:admin_dashboard_app/ui/views/main_view.dart';
import 'package:admin_dashboard_app/ui/views/orders_view.dart';
import 'package:admin_dashboard_app/ui/views/user_view.dart';
import 'package:admin_dashboard_app/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';


class DashboardHandlers {

  static  Handler main = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);
      
      Provider.of<MenuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.dashboardRoute); 


      if(authProvider.authStatus == AuthStatus.authenticated){
          return const MainView();
      }else{
        return const LoginView();
      }
    }
  );
  static  Handler orders = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<MenuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.ordersRoute); 


      if(authProvider.authStatus == AuthStatus.authenticated){
          return const OrdersView();
      }else{
        return const LoginView();
      }
    }
  );


  static  Handler categories = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<MenuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.categoriesRoute); 


      if(authProvider.authStatus == AuthStatus.authenticated){
          return const CategoriesView();
      }else{
        return const LoginView();
      }
    }
  );


  static  Handler users = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<MenuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.usersRoute); 


      if(authProvider.authStatus == AuthStatus.authenticated){
          return const UsersView();
      }else{
        return const LoginView();
      }
    }
  );


  static  Handler user = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);

      Provider.of<MenuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.userRoute); 


      if(authProvider.authStatus == AuthStatus.authenticated){

          if(params['uid']?.first != null){
            return UserView(uid: params['uid']!.first);
          }else{
            return const UsersView();
          }
          
      }else{
        return const LoginView();
      }
    }
  );





}