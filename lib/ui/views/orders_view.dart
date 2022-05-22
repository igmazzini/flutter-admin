import 'package:admin_dashboard_app/ui/cards/white_card.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {

  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Orders',style: CustomLabels.h1 ,),
          const SizedBox(height: 10,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children:  [
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.ac_unit_outlined))),
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.abc_sharp))),
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.access_alarm))),
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.access_time_sharp))),
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.accessible_rounded))),
              WhiteCard(width: size.width * 0.18, title: 'Titulo', child: const Center(child: Icon(Icons.account_balance_wallet_outlined))),
            ],
          )
        ],
      ),
    );
  }
}