import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';
import 'firebase_options.dart'; // Pastikan file ini sudah di-generate
import 'package:provider/provider.dart';
import 'service/auth_service.dart'; // Pastikan Anda memiliki AuthService yang sesuai

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // Handle error
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Gagal menginisialisasi Firebase: ${snapshot.error}'),
              ),
            ),
          );
        }

        // Jika inisialisasi selesai
        if (snapshot.connectionState == ConnectionState.done) {
          return const MediQuick();
        }

        // Menampilkan loading indicator saat menunggu inisialisasi
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class MediQuick extends StatelessWidget {
  const MediQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Menambahkan Provider untuk AuthService
        Provider<AuthService>(create: (_) => AuthService()),
        // Tambahkan provider lain jika diperlukan
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
