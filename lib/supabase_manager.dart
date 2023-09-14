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

  addData(String task, bool status, context) async {
    try {
      await Supabase.instance.client
          .from('notes')
          .upsert({'title': task, 'status': status});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Saved the Task'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error saving task'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
