import 'package:admin_dashboard_app/api/cafe_api.dart';
import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/providers/categories_provider.dart';
import 'package:admin_dashboard_app/providers/menu_provider.dart';
import 'package:admin_dashboard_app/providers/user_form_porvider.dart';
import 'package:admin_dashboard_app/providers/users_provider.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/services/local_storage.dart';
import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:admin_dashboard_app/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard_app/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard_app/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  
  await LocalStorage.configurePrefs();

  CafeApi.configureDio();

  Flurorouter.configureRoutes();

  runApp(const AppState());
}


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AuthProvider()
          ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => MenuProvider()
          ),
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => CategoriesProvider()
          ),
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => UsersProvider()
          ),
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => UserFormProvider()
          )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.notificationsKey,
      builder: (context, child){
       
        final authProvider = Provider.of<AuthProvider>(context);

        if(authProvider.authStatus == AuthStatus.checking){
           return const SplashLayout();
        }

        if(authProvider.authStatus == AuthStatus.authenticated){
           return DashboardLayout(child: child!,);
        }

        return AuthLayout(child: child!,);
      },

      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.white.withOpacity(0.7)
          )
        )
      ),
    );
  }
}