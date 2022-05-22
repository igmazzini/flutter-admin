import 'package:admin_dashboard_app/providers/menu_provider.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/search_input.dart';
import 'package:flutter/material.dart';


class CustomNavBar extends StatelessWidget {

  final String title;

  const CustomNavBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,    
      child: Row(
        children: [
          if(size.width < 700)
            IconButton(onPressed: (){ MenuProvider.openMenu(); }, icon: const Icon(Icons.menu_outlined,)),
          const SizedBox(width: 10,),
          if(size.width > 335)
            ConstrainedBox(
              constraints:  BoxConstraints(
                maxWidth: (size.width > 375) ?  250 : 190
                ),
              child: const SearchInput(),
              ),
          const  Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10,),
          const NavbarAvatar(),
          const SizedBox(width: 10,),
        ],
      ),
      decoration: _buildDecoration(),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}