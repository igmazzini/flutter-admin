import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/providers/login_form_provider.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_app/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(builder: (context){

        final formProvider = Provider.of<LoginFormProvider>(context);

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
                      onFieldSubmitted: (_) => onFormSubmit(formProvider, authProvider),
                      validator:(value){


                        if(value == null) return 'Ingrese su email';
                         if(value.isEmpty) return 'Ingrese su email';

                        if(EmailValidator.validate(value)){
                          return null;
                        }else{
                          return 'Email invalido';
                        }

                      },
                      onChanged: (value) => formProvider.email = value,
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
                      validator:( val ){
                       
                        if(val == null) return 'Ingrese su contraseña';
                        if(val.isEmpty) return 'Ingrese su contraseña';
                        if(val.length < 6) return 'Minimo 6 caracteres';
      
                        return null;//Valido
                      },
                      onChanged: (value) => formProvider.password = value,
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
                    CustomOutlinedButton(text: 'Ingresar',isFilled: true,textColor: Colors.white, onPressed: (){
                      
                     onFormSubmit(formProvider,authProvider);
                      
                    },),
                    const SizedBox(height: 20,),
                    LinkText(text: 'Nueva cuenta', onTap: (){
                      NavigationService.replaceTo(Flurorouter.registerRoute);
                      //Navigator.pushNamed(context, Flurorouter.registerRoute);
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

    void onFormSubmit(LoginFormProvider formProvider, AuthProvider authProvider){
     if(formProvider.validateForm()){

      authProvider.login(formProvider.email, formProvider.password);

    }
  }

}