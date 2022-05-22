
import 'package:admin_dashboard_app/ui/views/not_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';
import 'router.dart';

class NotFoundHandlers {

  static  Handler noPageFound = Handler(
    handlerFunc: (context, params){

      Provider.of<MenuProvider>(context!,listen: false).setCurrentPageUrl('/404'); 
      return const NotPageFoundView();
    }
  );




}