import 'package:admin_dashboard_app/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         
      height: 40,
      decoration: _builDecoration(),  
      padding: const EdgeInsets.only(left:10),
      child: TextField(
        decoration:CustomInputs.searchInputDecoration(hint: 'Buscar', icon: Icons.search_outlined)
      ),
    );
  }

  BoxDecoration _builDecoration() => BoxDecoration(
    color: Colors.grey.withOpacity(0.1), 
    borderRadius: BorderRadius.circular(10)
  );
}