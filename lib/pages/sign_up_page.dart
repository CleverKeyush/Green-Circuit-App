import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  final void Function()? onPressed;
  const SignUP({super.key, required this.onPressed});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up",
            style: TextStyle(
                color: Color.fromRGBO(0, 200, 0, 40),
                fontWeight: FontWeight.bold,
                fontSize: 30)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _email,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Email is empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(0, 200, 0, 10))),
                ),
                TextFormField(
                  controller: _password,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Password is empty';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(0, 200, 0, 10))),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(0, 0, 0, 0.965))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createUserWithEmailAndPassword();
                      }
                    },
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          )
                        : const Text(
                            "SignUp",
                            style:
                                TextStyle(color: Color.fromRGBO(0, 200, 0, 40)),
                          ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(0, 200, 0, 40))),
                    onPressed: widget.onPressed,
                    child: const Text("Login",
                        style:
                            TextStyle(color: Color.fromRGBO(0, 0, 0, 0.847))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
