import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sql_netcore/screens/homescreen.dart';
import 'package:sql_netcore/screens/signup_db.dart';
import 'package:sql_netcore/widgets/textformfield.dart';

class SignIn_DB extends StatefulWidget {
  const SignIn_DB({super.key});

  @override
  State<SignIn_DB> createState() => _SignIn_DBState();
}

class _SignIn_DBState extends State<SignIn_DB> {
  final TextEditingController _correoTextCotroller = TextEditingController();
  final TextEditingController _passwordTextCotroller = TextEditingController();

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
            height: 250,
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
                  "Acceder",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        reusableTextfield("Correo Electronico",
                            Icons.email_outlined, false, _correoTextCotroller),
                        const SizedBox(
                          height: 30,
                        ),
                        reusableTextfield("Contrasena", Icons.lock_outline,
                            true, _passwordTextCotroller),
                        const SizedBox(
                          height: 20,
                        ),
                        signInUPButton(context, true, () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _correoTextCotroller.text,
                                  password: _passwordTextCotroller.text)
                              .then((value) {
                            print("Bienvenido");
                          });

                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                              .onError((error, stackTrace) {
                            print("Error${error.toString()}");
                          });
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          signUpOption()
        ],
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes cuenta?", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signup_db()));
          },
          child: const Text(
            " Registrate",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
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
