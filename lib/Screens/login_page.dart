import 'package:flutter/material.dart';
import 'package:flutterapp/utils/routes.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //const Loginpage({super.key});
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      //color: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/login_image.jpg",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can't be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 6) {
                      return "Password length can't be less than 6 letters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(changeButton ? 15 : 10),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 100 : 150,
                      alignment: Alignment.center,
                      /*decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(changeButton ? 15 : 10),
                      ),*/
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),

                /*ElevatedButton(
                  style: TextButton.styleFrom(minimumSize: const Size(100, 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, Myroutes.homeRoute);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
