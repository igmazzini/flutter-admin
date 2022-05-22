import 'package:admin_dashboard_app/providers/menu_provider.dart';
import 'package:admin_dashboard_app/ui/shared/sidebar.dart';
import 'package:admin_dashboard_app/ui/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MenuProvider.menuController = AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const  Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children:  [
              if(size.width >= 700)
                 const SideBar(),          
              Expanded(
                child: Column(
                  children: [
                    const CustomNavBar(title: 'Dashboard',),
                    Expanded(child: widget.child),
                  ],
                ),
              )
            ]
            ),
            if(size.width < 700)
              AnimatedBuilder(
                animation: MenuProvider.menuController,
                builder: (context, _) => Stack(
                  children:  [                    
                    
                    if(MenuProvider.isOpen)
                      AnimatedOpacity(
                      
                        opacity: MenuProvider.opacity.value,
                        duration: const Duration(milliseconds: 260),
                        child: GestureDetector(
                          onTap: () => MenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black12,
                          ),
                        ),
                      )
                    ,                    
                    Transform.translate(
                      offset: Offset(MenuProvider.movement.value, 0),
                      child: const SideBar(),
                      
                      )
                  ],
                )
              )
        ],
      ),
    );
  }
}

class NavBar {
}