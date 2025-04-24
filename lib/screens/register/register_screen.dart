import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/login/login_screen.dart';
import 'package:mediquick_pbl/widget/register/register_input_field.dart';
import 'package:mediquick_pbl/widget/register/register_social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:mediquick_pbl/service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _validateAndRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final authService = Provider.of<AuthService>(context, listen: false);
        User? user = await authService.signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _nameController.text.trim(),
        );

        if (user != null) {
          _showSuccessDialog(); // Tampilkan pop-up sukses
        }
      } on FirebaseAuthException catch (e) {
        _showErrorDialog(e.message ?? "Terjadi kesalahan saat registrasi");
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // User harus tekan OK untuk menutup
      builder: (ctx) => AlertDialog(
        title: const Text('Registrasi Berhasil'),
        content: const Text('Akun Anda berhasil dibuat. Silakan login.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // Tutup dialog dan navigasi ke login
              Navigator.of(ctx).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Registrasi Gagal'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Registrasi",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Buat akun sekarang untuk menikmati\nsemua fitur MediQuick",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),

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
                      if (value == null || value.isEmpty)
                        return "Email harus diisi";
<<<<<<< HEAD
                      } else if (!value.contains("@gmail.com")) {
                        return "Email harus menggunakan @gmail.com";
=======
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return "Format email tidak valid";
>>>>>>> 6a68d2e5e24ef7f5805e31a1b1eedeff5cea2469
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
                      if (value == null || value.isEmpty)
                        return "Kata sandi harus diisi";
                      if (value.length < 6) return "Minimal 6 karakter";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Daftar Button
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
                      onPressed: _isLoading ? null : _validateAndRegister,
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
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
                        Text(
                          "Sudah Punya Akun?",
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
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Masuk",
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