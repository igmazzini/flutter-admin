
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard_app/providers/auth_provider.dart';
import 'package:admin_dashboard_app/providers/user_form_porvider.dart';
import 'package:admin_dashboard_app/providers/users_provider.dart';
import 'package:admin_dashboard_app/router/router.dart';
import 'package:admin_dashboard_app/services/navigation_service.dart';
import 'package:admin_dashboard_app/services/notifications_service.dart';
import 'package:admin_dashboard_app/ui/cards/white_card.dart';
import 'package:admin_dashboard_app/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard_app/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';


import 'package:provider/provider.dart';

import '../../models/usuario.dart';

class UserView extends StatefulWidget {


  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  Usuario? user;

  @override
  void initState() {
    
    super.initState();


    final userProvider = Provider.of<UsersProvider>(context,listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context,listen: false);
    
    userProvider.getUserById(widget.uid).
    then((userDB) { 
      
      if(userDB != null){
        setState((){ 
          user = userDB;
          userFormProvider.user = user;     
          userFormProvider.formKey = GlobalKey<FormState>(); 
        });

      }else{
        NavigationService.replaceTo(Flurorouter.usersRoute);
      }
      
    }
    );
  }



  @override
  void dispose() {  
    super.dispose();
    user = null;
    Provider.of<UserFormProvider>(context,listen: false).user = null;

  }


  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);
    

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('UserView ${widget.uid}',style: CustomLabels.h1 ,),
          const SizedBox(height: 10,),
          if(user == null)
            WhiteCard(
              title: 'Chequeando usuario...',
              child:  Container(
                height: 400,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ),
          if(user != null)
            const _UserViewBody()        
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Table(
        columnWidths: const {
          0:FixedColumnWidth(250)
        },
        children: const[
          TableRow(
            children: [
               _AvatarContainer(),
               _UserForm()
            ]
          )
        ],
      ),
    );
  }
}

class _UserForm extends StatelessWidget {
  const _UserForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;

    return WhiteCard(
      title: 'Informacion de usuario',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            const SizedBox(height: 15,),
            TextFormField(
              onChanged: (value) => userFormProvider.copyUserWith(nombre:value),
              validator: ( value ) {
                if( value == null || value.isEmpty ) return 'El nombre no puede estar vacio';
                if( value.length < 2) return 'Minimo 4 caracteres';
                return null;
              },
              initialValue: user!.nombre,
              decoration: CustomInputs.userFormInputDecoration(hint: 'Nombre de usuario', label: 'Nombre', icon: Icons.supervisor_account_outlined),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              onChanged: (value) => userFormProvider.copyUserWith(correo:value),
              validator: ( value ){
                if( !EmailValidator.validate(value ?? '') ) return 'Correo no valido';
                return null;
              },
              initialValue: user.correo,
              decoration: CustomInputs.userFormInputDecoration(hint: 'Correo de usuario', label: 'Correo', icon: Icons.email_outlined),
            ),
            const SizedBox(height: 20,),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: ElevatedButton(
                onPressed: () async{
                  if(userFormProvider.validForm()){

                    final saved = await usersProvider.updateUser(user);
                    if(saved){
                      NotificationService.showSnackBarSuccess('Usuario actualizado');
                    }else{
                      NotificationService.showSnackBarError('No se pudo actualizar el usuario');
                    }
                  }
                  
                },
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.indigo),
                  shadowColor:MaterialStateProperty.all(Colors.transparent),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.save_outlined, size: 20,),
                    SizedBox(width: 10,),
                    Flexible(child: Text('Guardar'))
                  ],
                )
                ),
            )

          ],
        ),
      )
     );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;


    final image = (user!.img == null)
          ? const Image(image: AssetImage('no-image.jpg'),)
          : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);


   

    return WhiteCard(
      title: 'Profile',
      child: Container(
        width: double.infinity,
        child: Column(        
          children: [
            const SizedBox(height: 20,),
             Container(
              width: 150,
              height: 160,
              child: Stack(
                children:  [
                   ClipOval(child:  image),
                   Positioned(
                     bottom: 5,
                     right: 5,
                     child: Container(
                       width: 45,
                       height: 45,
                       decoration:  BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         border:  Border.all(color: Colors.white, width: 5)
                       ),
                       child: FloatingActionButton(
                         backgroundColor: Colors.indigo,
                         elevation: 0,
                         child: const Icon(Icons.camera_alt_outlined, size: 20,),
                         onPressed: () async{

                           try {

                             FilePickerResult? result = await FilePicker.platform.pickFiles(                            
                             type: FileType.custom,
                             allowedExtensions: ['jpg', 'jpeg', 'png'],
                           
                           );

                            if (result != null) {

                              PlatformFile file = result.files.first;


                              NotificationService.showWorking(context);

                              final resp = await usersProvider.uploadImage('/uploads/usuarios/${user.uid}', file.bytes!, user.uid);
                             
                              user.img = resp.img;     
                              Navigator.of(context).pop();
                                                            
                            } else {
                                print('No files selected');
                            }
                             
                           } catch (e) {

                             print('File piker error $e');
                           }

                           
                         },
                       ),
                     ),
                   )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text(user.nombre)
          ],
        ),
      )
      );
  }
}