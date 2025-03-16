import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/login/forgot_password_screen.dart';
import 'package:mediquick_pbl/screens/register/register_screen.dart';
import 'package:mediquick_pbl/widget/login/custom_text_field.dart';
import 'package:mediquick_pbl/widget/login/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key untuk validasi form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      print("Login Berhasil");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60), // Spacer atas
                  Text(
                    "Masuk",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Masuk untuk pengalaman terbaik dengan MediQuick",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Input Email
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    isPassword: false,
                    prefixIcon: Icons.email,
                    borderColor: Colors.black,
                    iconColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email harus diisi";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // Input Password
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Kata Sandi",
                    isPassword: true,
                    prefixIcon: Icons.visibility,
                    borderColor: Colors.black,
                    iconColor: Colors.black,
                    onPrefixTap: () {
                      print("Toggle visibility password");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kata sandi harus diisi";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  // Checkbox & Lupa Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text("Ingat saya"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Lupa kata sandi?",
                          style: TextStyle(
                            color: Color(0xFF6482AD),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  // Tombol Masuk
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateAndLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6482AD),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Garis atau dengan
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

                  SizedBox(height: 25),

                  // Tombol Login dengan Google & Facebook
                  SocialLoginButton(
                    text: "Masuk dengan Facebook",
                    iconPath: "assets/icons/facebook.png",
                    onPressed: () {
                      print("Login dengan Facebook");
                    },
                  ),

                  SizedBox(height: 16),

                  SocialLoginButton(
                    text: "Masuk dengan Google",
                    iconPath: "assets/icons/google.png",
                    onPressed: () {
                      print("Login dengan Google");
                    },
                  ),

                  SizedBox(height: 20),

                  // Daftar Akun
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Daftar",
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
