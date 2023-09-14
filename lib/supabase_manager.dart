import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  final supabase = Supabase.instance.client;

  void signUpUser(String email, String password) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  getData() async {
    var response = await supabase.from('notes').select();
    if (response.error == null) {
      print('response.data: ${response.data}');
    }
    return response;
    print('Read data: $response');
  }

  addData(String title, String desc) async {
    await supabase.from('notes').insert([
      {'title': title, 'description': desc}
    ]);
  }
}
