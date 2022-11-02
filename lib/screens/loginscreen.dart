import 'package:flutter/material.dart';
import 'package:sql_netcore/screens/homescreen.dart';
import 'package:sql_netcore/screens/signup.dart';
import 'package:sql_netcore/widgets/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [logocaja(size), logo(), cuerpocompleto(context)],
        ),
      ),
    );
  }

  SingleChildScrollView cuerpocompleto(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 300,
          ),
          Container(
            constraints: const BoxConstraints(minHeight: 350),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  )
                ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          decoration: Inputdecorations.inputDecoration(
                            hintext: 'ejemplo@hotmail.com',
                            labeltext: 'Correo Electronico',
                            icon: const Icon(Icons.alternate_email_rounded),
                          ),
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = RegExp(pattern);
                            return regExp.hasMatch(value ?? '')
                                ? null
                                : 'No es un correo';
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: Inputdecorations.inputDecoration(
                              hintext: '*****',
                              labeltext: 'contrasena',
                              icon: const Icon(Icons.lock)),
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'la contrasena debe ser mayor o igual a 8 caracteres';
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledColor: Colors.grey,
                          color: Colors.blueAccent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUP()));
            },
            child: const Text('Crear una Nueva Cuenta'),
          )
        ],
      ),
    );
  }

  SafeArea logo() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        child: Image.asset("images/Logoblanco.png"),
      ),
    );
  }

  Container logocaja(Size size) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: bubble(),
          ),
          Positioned(
            top: -30,
            left: -30,
            child: bubble(),
          ),
          Positioned(
            top: 50,
            right: -30,
            child: bubble(),
          )
        ],
      ),
    );
  }

  Container bubble() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
