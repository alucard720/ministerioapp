import 'package:flutter/material.dart';

import 'package:sql_netcore/screens/homescreen.dart';
import 'package:sql_netcore/screens/loginscreen.dart';

import '../widgets/input_decoration.dart';

class signup_db extends StatefulWidget {
  const signup_db({super.key});

  @override
  State<signup_db> createState() => _signup_dbState();
}

class _signup_dbState extends State<signup_db> {
  final TextEditingController _FirstNamecontroller = TextEditingController();
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [logocaja(size), logo(), cuerpocompleto(context)],
        ),
      ),
    );
  }

  SingleChildScrollView cuerpocompleto(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 440, minHeight: 200),
            padding: const EdgeInsets.all(20),
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
                  "Registrarse",
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
                          controller: _FirstNamecontroller,
                          keyboardType: TextInputType.name,
                          autocorrect: false,
                          decoration: Inputdecorations.inputDecoration(
                              hintext: 'Ingresar Cedula o Pasaporte',
                              labeltext: 'Cedula o Pasaporte',
                              icon: const Icon(Icons.person_add)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _Emailcontroller,
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
                          controller: _Passwordcontroller,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: Inputdecorations.inputDecoration(
                              hintext: '*****',
                              labeltext: 'contrasena',
                              icon: const Icon(Icons.lock)),
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'la contrasena debe ser mayor o igual a 6 caracteres';
                          },
                        ),
                        const SizedBox(
                          height: 30,
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
                                horizontal: 80, vertical: 15),
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
            height: 40,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('si ya tienes cuenta pulsa aqui'),
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
