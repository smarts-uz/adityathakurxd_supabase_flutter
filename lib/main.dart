import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://izqjpmoeaelmziyjkixe.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6cWpwbW9lYWVsbXppeWpraXhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ0MzE2MzAsImV4cCI6MjAxMDAwNzYzMH0.yeStxGVEFrp51OlYhHfvu-x7BgDLjSIjv17LynkYrvY',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
