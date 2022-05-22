
import 'package:admin_dashboard_app/router/admin_handlers.dart';
import 'package:admin_dashboard_app/router/dashboard_handlers.dart';
import 'package:admin_dashboard_app/router/not_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter();


  static String rootRoute = '/';

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';



  static String dashboardRoute = '/dashboard';
  static String ordersRoute = '/orders';
  static String categoriesRoute = '/categories';
  static String usersRoute = '/users';
  static String userRoute = '/user/:uid';


  static void configureRoutes() {



    //Login
    router.define(rootRoute, handler: AdminHandlers.login,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(loginRoute, handler: AdminHandlers.login,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(registerRoute, handler: AdminHandlers.register,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    

    //Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.main,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(ordersRoute, handler: DashboardHandlers.orders,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(categoriesRoute, handler: DashboardHandlers.categories,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(usersRoute, handler: DashboardHandlers.users,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
    router.define(userRoute, handler: DashboardHandlers.user,transitionType: TransitionType.none,transitionDuration: const Duration(milliseconds: 100));
   

    router.notFoundHandler = NotFoundHandlers.noPageFound;
  }



}