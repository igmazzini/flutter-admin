import 'package:admin_dashboard_app/providers/login_form_provider.dart';
import 'package:admin_dashboard_app/providers/register_form_provider.dart';
import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:admin_dashboard_app/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_app/ui/buttons/link_text.dart';
import 'package:admin_dashboard_app/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../router/router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context){

        final formProvider = Provider.of<RegisterFormProvider>(context,listen: false);

        return Container(
        
        margin: const EdgeInsets.only(top:100),
        padding: const EdgeInsets.symmetric(horizontal: 20),    
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              key: formProvider.formKey,
              child:Column(
                children: [
                  TextFormField(
                    validator:( value ){ 
                      if(value == null) return 'Ingrese su nombre';
                      if(value.isEmpty) return 'Ingrese su nombre';
                      return null;
                      
                    },
                    onChanged: (val){
                      formProvider.name = val;
                    },
                    style: const TextStyle(
                     color: Colors.white
                    ),
                    decoration: CustomInputs.loginInputDecoration( 
                      hint: 'Ingrese su nombre',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_sharp
    
                    ),
                  ),
                   const SizedBox(height: 20,),
                  TextFormField(
                    validator:( value ){ 
                      if(value == null) return 'Ingrese su correo electronico';
                      if(value.isEmpty) return 'Ingrese su correo electronico';
                      if(EmailValidator.validate(value) == false) return 'Correo invalido';
                      return null;
                      
                    },
                    onChanged: (val){
                      formProvider.email = val;
                    },
                    style: const TextStyle(
                     color: Colors.white
                    ),
                    decoration: CustomInputs.loginInputDecoration( 
                      hint: 'Ingrese su correo',
                      label: 'Email',
                      icon: Icons.email_outlined
    
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onFieldSubmitted: (_) => onFormSubmit(formProvider, authProvider),
                    validator:( value ){ 
                      if(value == null) return 'Ingrese su contraseña';
                      if(value.isEmpty) return 'Ingrese su contraseña';
                      if(value.length < 6 ) return 'Minimo 6 caracteres';
                      return null;
                      
                    },
                    onChanged: (val){
                      formProvider.password = val;
                    },
                    obscureText: true,
                    style: const TextStyle(
                     color: Colors.white
                    ),
                    decoration: CustomInputs.loginInputDecoration( 
                      hint: '*****',
                      label: 'Password',
                      icon: Icons.lock_outline_rounded
    
                    ),
                  ),
                  const SizedBox(height: 15,),
                  CustomOutlinedButton(text: 'Crear cuenta',isFilled: true,textColor: Colors.white, 
                  onPressed: (){                      
                   
                    onFormSubmit(formProvider, authProvider);
                  },),
                  const SizedBox(height: 20,),
                  LinkText(text: '¿Ya tienes cuenta?', onTap: (){
                    NavigationService.replaceTo(Flurorouter.loginRoute);
                    //Navigator.pushNamed(context, Flurorouter.loginRoute);
                  })
                ],
              ) 
              ),
          )
          
          ),
      );
      }),
    );
  }

  void onFormSubmit(RegisterFormProvider formProvider, AuthProvider authProvider){
     if(formProvider.validateForm()){

      authProvider.register(formProvider.name, formProvider.email, formProvider.password);

    }
  }

 
}