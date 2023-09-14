import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  final supabase = Supabase.instance.client;

  void signUpUser(String email, String password) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  deleteData(int id) async {
    await Supabase.instance.client.from('notes').delete().match({'id': id});
  }

  getData() async {
    try {
      var response = await supabase.from('notes').select();
      print('notest $response');
      return response;
    } catch (e) {
      print('Error  $e');
    }
  }

  addData(String title, String desc) async {
    await supabase.from('notes').insert([
      {'title': title, 'description': desc}
    ]);
  }
}
