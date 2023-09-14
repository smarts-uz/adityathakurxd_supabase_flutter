import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/homepage.dart';
import 'package:test/supabase_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  SupabaseManager supabaseManager = SupabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(

                    onPressed: () async {
                       Supabase.instance.client.auth.signUp(
                          password: '12345678', email: 'supabase@test.com');
                      print('Signed Up');
                      await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                'Sign into to Supabase',
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                    )
                )
            )
        )
    );
  }
}
