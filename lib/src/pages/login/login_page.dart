import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../models/response_api.dart';
import '../../widget/my_snackbar.dart';
import '../../utils/my_colors.dart';
import 'login_controller.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   LoginController _con = new LoginController();
   String msgLogin = 'Ingresar';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
   // print('build');
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Stack(
                children: [

                  Positioned(
                      top: -80,
                      left: -100,
                      child: _circleLogin()
                  ),

                  Positioned(
                    child: _textLogin(),
                    top: 60,
                    left: 25,
                  ),

                  Column(
                      children: [
                        _lottieAnimation(),
                        //_imageBanner(),
                        _textFieldEmail(),
                        _textFieldClave(),
                        _botonLogin(),
                        _textNoTieneCuenta(),
                      ],
                  ),

                ],
              )
          ),
        ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 150,
          bottom: MediaQuery.of(context).size.height * 0.17
      ),
      child: Lottie.asset(
          'assets/json/delivery-login.json',
          width: 350,
          height: 200,
          fit: BoxFit.fill
      ),
    );
  }

  Widget _textLogin(){
    return Text('LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans',
      ),
    );
  }

  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
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
          controller: _con.PasswordController,
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

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: TextField(
        controller: _con.EmailController,
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

  Widget _botonLogin(){
     return Container(
       width: double.infinity,
       margin: const EdgeInsets.symmetric(horizontal: 50,
           vertical: 30),
       child: ElevatedButton(onPressed: () async {
         setState(() {
           msgLogin = 'Ingresando...';
         });
         ResponseApi responseApi =  await _con.login();
         setState(() {
           msgLogin = 'Ingresar';
         });
         MySnackbar.show(context, responseApi.message.toString(),3);

       },
         child: Text(msgLogin),
         style: ElevatedButton.styleFrom(primary: MyColors.primaryColor,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30)
           ),
           padding: EdgeInsets.symmetric(vertical: 15),
         ),
       ),
     );
   }

  Widget _textNoTieneCuenta(){
     return Row(mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('¿ No Tienes Cuenta ?',
             style: TextStyle(fontWeight: FontWeight.normal,
                 color: MyColors.primaryColor
             ),
           ),
           const SizedBox(width: 7),
           GestureDetector(
             onTap: _con.gotoRegisterPage,
             child: Text('REGISTRESE',
               style: TextStyle(fontWeight: FontWeight.bold,
                   color: MyColors.primaryColor
               ),
             ),
           ),
         ]
     );
   }

  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
          top: 100,
          bottom: MediaQuery.of(context).size.height*0.2),
      child: Image.asset('assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }



}
