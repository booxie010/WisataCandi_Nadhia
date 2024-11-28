
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //TODO: 1. Deklarasikan Variable
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedUp = false;
  bool _obscurePassword = false;

  //TODO: 7. Buat Fungsi untuk _signUp
  void _signUp() {
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8) {
      !password.contains(RegExp(r'[A-Z]')) ||
      !password.contains(RegExp(r'[a-z]')) ||
      !password.contains(RegExp(r'[0-9]')) ||
      !password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')); 
        _showError("Password harus memiliki minimal 8 karakter yang mengandung huruf besar, huruf kecil, angka, dan karakter khusus.");
    }
    print('*** Sign up berhasil!');
    print('Nama: $name');
    print('Nama Pengguna: $username');
    print('Password: $password');
  }
    //TODO: 8. Membuat fungsi dispose
    @override
    void dispose() {
      //TODO: implement dispose
      super.dispose();
    }
  void _showError(String message) {
    setState(() {
      _errorText = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : 2. Pasang AppBar
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      //TODO : 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                //TODO: 4. Atur MainAxisAlignment dan CrossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO: 9. Pasang TextFormField Nama
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //TODO: 5. Pasang TextFormField Nama Pengguna
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //TODO: 6. Pasang TextFormField Kata sandi
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
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  //TODO: 7. Pasang ElavatedButton Sign Up
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Sign Up"),
                  ),
                  //TODO: 8. Pasang TextButton Sign Up
                  const SizedBox(
                    height: 20,
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text('Belum Punya Akun? Daftar Disini.'),
                  // ),
                  RichText(
                    text: const TextSpan(
                      text: "Sudah punya Akun?",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Masuk Disini.',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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