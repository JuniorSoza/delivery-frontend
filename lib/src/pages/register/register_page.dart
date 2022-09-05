import 'package:delivery/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../models/response_api.dart';
import '../../utils/my_colors.dart';
import '../../widget/my_snackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    top: -80,
                    left: -100,
                    child: _circle()
                ),

                Positioned(
                  child: _textRegister(),
                  top: 60,
                  left: 27,
                ),

                Positioned(
                    top: 51,
                    left: -5,
                    child: _IconsBack()
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top:150),
                  child: SingleChildScrollView(
                    child: Column(
                      children:[
                        //_imageUser(),
                        SizedBox(height: 30),
                        _textFieldEmail(),
                        _textFieldNombre(),
                        _textFieldApellido(),
                        _textFieldTelefono(),
                        _textFieldClave(),
                        _textFieldConfirmarClave(),
                        _botonRegistrar(),
                      ],
                    ),
                  ),
                )

              ],
            ),

      ),
    );
  }
  Widget _imageUser(){
      return CircleAvatar(
        backgroundImage: AssetImage('assets/img/user_profile_2.png'),
        radius: 60,
        backgroundColor: Colors.grey[200],
      );
  }
  Widget _circle(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
      ),
    );
  }
  Widget _IconsBack(){
    return IconButton(
        onPressed: (){
          _con.gotoLoginPage();
        },
        icon: Icon(Icons.arrow_back_ios,color: Colors.white)
   );
  }
  Widget _textRegister(){
    return Text('REGISTRO',
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'NimbusSans',
          ),
        );
  }
  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
          controller: _con.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
          hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.email,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _textFieldNombre(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.person,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _textFieldApellido(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.lastnameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.person_outline,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _textFieldTelefono(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Telefono',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.phone,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _textFieldClave(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.lock,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _textFieldConfirmarClave(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDart
          ),
          prefixIcon: Icon(Icons.lock_outline,color: MyColors.primaryColor,
          )
      ),
      ),
    );
  }
  Widget _botonRegistrar(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50,
          vertical: 30),
      child: ElevatedButton(onPressed: () async {
        ResponseApi responseApi = await _con.register();
        MySnackbar.show(context, responseApi.message.toString(),3);
      },
        child: Text('REGISTRARSE'),
        style: ElevatedButton.styleFrom(primary: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }


}
