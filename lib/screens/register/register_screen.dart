import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/login/login_screen.dart';
import 'package:mediquick_pbl/widget/register/register_input_field.dart';
import 'package:mediquick_pbl/widget/register/register_social_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey untuk validasi form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndRegister() {
    if (_formKey.currentState!.validate()) {
      print("Registrasi Berhasil");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Tambahkan Form dengan GlobalKey
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Registrasi",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Buat akun sekarang untuk menikmati semua fitur MediQuick",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Fields
                  RegisterInputField(
                    controller: _nameController,
                    icon: Icons.person,
                    hint: "Username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username harus diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  RegisterInputField(
                    controller: _emailController,
                    icon: Icons.email,
                    hint: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email harus diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  RegisterInputField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hint: "Kata Sandi",
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kata sandi harus diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Tombol Daftar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6482AD),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed:
                          _validateAndRegister, // Validasi sebelum daftar
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Garis pembatas
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 3)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Atau dengan",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 3)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tombol Sosial Media
                  RegisterSocialButton(
                    text: "Masuk dengan Facebook",
                    iconPath: "assets/icons/facebook.png",
                    onPressed: () {
                      print("Login dengan Facebook");
                    },
                  ),
                  const SizedBox(height: 12),

                  RegisterSocialButton(
                    text: "Masuk dengan Google",
                    iconPath: "assets/icons/google.png",
                    onPressed: () {
                      print("Login dengan Google");
                    },
                  ),
                  const SizedBox(height: 20),

                  // Link ke halaman login
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah Punya Akun?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(color: Colors.blue),
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
