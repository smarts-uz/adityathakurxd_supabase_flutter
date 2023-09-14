import 'package:flutter/material.dart';
import 'package:test/supabase_manager.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SupabaseManager supabaseManager = SupabaseManager();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                 await supabaseManager.getData();
                 print('Got Data');
                },
                child:const Text('Read Data'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await supabaseManager.addData('newFlutter', 'newSupabase');
                  print('added data');
                },
                child:const Text('Add Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
