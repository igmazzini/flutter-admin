import 'package:admin_dashboard_app/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard_app/ui/layouts/auth/widgets/links_bar.dart';
import 'package:admin_dashboard_app/ui/layouts/auth/widgets/twitter_background.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(

        child: ListView(
          children: [
      
      
            (size.width > 1000)
              //Desktop
              ?_DesktopBody(child: child,)
              //Mobile
              :_MobileBody(child:child),
            //Links
            const LinksBar()
          ],
        ),
      )
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget  child;

  const _MobileBody({
    Key? key,  required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(      
       color: Colors.black,   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const CustomTitle(),         
          Container(height: 450,width: double.infinity, child: child),
          Container(height: 450, width: double.infinity, child: const  TwitterBackground())
        ]),
    );
  }
}


class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.90,
      color: Colors.black,
      child: Row(
        children: [
          const Expanded(child:  TwitterBackground()),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const CustomTitle(),
                const SizedBox(height: 50,),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}