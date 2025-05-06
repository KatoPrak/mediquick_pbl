import 'package:flutter/material.dart';
import 'package:mediquick_pbl/widget/login/custom_text_field.dart';
import 'package:mediquick_pbl/widget/login/social_login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Tambahkan ini agar tidak overflow
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Masuk",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Masuk untuk pengalaman terbaik dengan MediQuick"),
                SizedBox(height: 30),

                // Custom Text Fields
                CustomTextField(hintText: "Email", icon: Icons.email),
                SizedBox(height: 16),
                CustomTextField(hintText: "Kata Sandi", icon: Icons.lock),

                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text("Masuk")),

                SizedBox(height: 20),
                Center(child: Text("Atau dengan")),
                SizedBox(height: 16),

                // Social Login Buttons
                SocialLoginButton(
                  text: "Masuk dengan Facebook",
                  icon: Icons.facebook,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                SocialLoginButton(
                  text: "Masuk dengan Google",
                  icon: Icons.g_translate,
                  onPressed: () {},
                ),

                SizedBox(height: 20),
                Center(child: Text("Belum punya akun? Daftar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
