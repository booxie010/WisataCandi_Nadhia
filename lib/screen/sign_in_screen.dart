import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
 const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TODO: 1 deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     //TODO: 2 pasang AppBar
     appBar: AppBar(
       title: const Text('Sign In'),
     ),
     //TODO: 3 pasang body
     body: Center(
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Form(
             child: Column(
              //TODo: 4 Atur MainAxisAlignment dan CrossAxisAlignment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              //TODO: 5 pasang TextFormField nama Pengguna
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Nama Pengguna",
                  border: OutlineInputBorder(),
                ),
              ),
              //TODO: 6 pasang TextFormField kata sandi
              const SizedBox(
                height: 20,
                ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                   icon: Icon(_obscurePassword 
                   ? Icons.visibility 
                   : Icons.visibility_off),
                   ), 
                  ),
                ),
              //TODO: 7 buat ElevatedButton Sign In
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {},
               child: const Text("Sign In",),
               ),
               //TODO: 8 pasang TextButton sign up
               SizedBox(height: 20,),
               TextButton(onPressed: () {},
                child: const Text("Belum Punya Akun? Daftar Disini"),
                ),
                RichText(
                  text:TextSpan(
                    text: "Belum Punya Akun? ",
                    style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Daftar Disini", 
                        style: const TextStyle(
                          fontSize: 16, color: Colors.blue,
                          decoration: TextDecoration.underline
                          ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {},
                      ),
                    ]
                  )
                ),
              ],
                 ),
                 ),
         ),
       ),
     ),
    );
  }
}