import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/ui/views/login_view.dart';
import 'package:admin_dashboard_app/ui/views/main_view.dart';
import 'package:admin_dashboard_app/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AdminHandlers {

  static  Handler login = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);


      if(authProvider.authStatus == AuthStatus.notAuthenticated){
         return const LoginView();
      }else{
        return const MainView();
      }
     
    }
  );
  static  Handler register = Handler(
    handlerFunc: (context, params){

      final  authProvider = Provider.of<AuthProvider>(context!);

      if(authProvider.authStatus == AuthStatus.notAuthenticated){
          return const RegisterView();
      }else{
        return const MainView();
      }
     
    }
  );




}