import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediquick_pbl/screens/login/forgot_password_screen.dart';
import 'package:mediquick_pbl/screens/navigasi_screen.dart';
import 'package:mediquick_pbl/screens/register/register_screen.dart';
import 'package:mediquick_pbl/screens/dashboard/dashboard_screen.dart'; // Import your dashboard screen
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
  bool _isLoading = false;

  void _validateAndLogin() async {
    if (_formKey.currentState!.validate()) {
<<<<<<< HEAD
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
      print("Login Berhasil");
=======
      setState(() => _isLoading = true);

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()), // Navigate to dashboard
          );
        }
      } on FirebaseAuthException catch (e) {
        _showErrorDialog(e.message ?? "Terjadi kesalahan saat login");
      } finally {
        setState(() => _isLoading = false);
      }
>>>>>>> 6a68d2e5e24ef7f5805e31a1b1eedeff5cea2469
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Login Gagal'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
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
                  SizedBox(height: 10),
                  Text(
                    "Masuk untuk pengalaman terbaik\ndengan MediQuick",
                    style: TextStyle(
                      fontSize: 16,
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
                          Text(
                            "Ingat saya",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Lupa kata sandi?",
                          style: TextStyle(
                            color: Color(0xff3311F5),
                            fontWeight: FontWeight.bold,
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
                      onPressed: _isLoading ? null : _validateAndLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6482AD),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
<<<<<<< HEAD
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
=======
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
>>>>>>> 6a68d2e5e24ef7f5805e31a1b1eedeff5cea2469
                    ),
                  ),

                  SizedBox(height: 25),

                  // Garis atau dengan
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 2, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Atau dengan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 2, color: Colors.black),
                      ),
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
                        Text(
                          "Belum punya akun?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                            style: TextStyle(color: Color(0xFF3311F5)),
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