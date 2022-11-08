import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sql_netcore/screens/homescreen.dart';
import 'package:sql_netcore/screens/signin_db.dart';
import 'package:sql_netcore/widgets/textformfield.dart';

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
            constraints: const BoxConstraints(maxHeight: 420, minHeight: 200),
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
                  height: 10,
                ),
                Form(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        reusableTextfield(
                            "Cedula o Pasaporte",
                            Icons.person_add_alt_outlined,
                            false,
                            _FirstNamecontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextfield("Correo Electronico",
                            Icons.email_outlined, false, _Emailcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextfield("Contrasena", Icons.lock_outline,
                            true, _Passwordcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        signInUPButton(context, false, () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _Emailcontroller.text,
                                  password: _Passwordcontroller.text)
                              .then((value) {
                            print("Nueva Cuenta Creada");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
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
            height: 10,
          ),
          signInOption()
        ],
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Si tienes Cuenta", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn_DB()));
          },
          child: const Text(
            " Accede",
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

  @override
  void dispose() {
    _Emailcontroller.dispose();
    _Passwordcontroller.dispose();
    super.dispose();
  }
}
