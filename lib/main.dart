import 'package:crm_sahel_telecom/views/login.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/theme.dart';
import 'provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://fcehqentlljcpznvmsiv.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjZWhxZW50bGxqY3B6bnZtc2l2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc3ODc1NzEsImV4cCI6MjAwMzM2MzU3MX0.SmRqXsIoSutDVbFEAoSj6UXdq_lYSKSKxNo8-Tlj1Pk",
  );

  doWhenWindowReady(() {
    final win = appWindow;
    win.alignment = Alignment.center;
    win.title = "MBOUOLEY";
    win.show();
  });
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: FluentApp(
        theme: ThemeApp.lightTheme(),
        title: "MBOUOLEY",
        debugShowCheckedModeBanner: false,
        home: const Login(),
      )));
}
