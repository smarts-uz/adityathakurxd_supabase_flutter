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
          child: FutureBuilder(
            future: supabaseManager.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data!.length ?? 0,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      title: Text(snapshot.data[i]['title']),
                      subtitle: Text(snapshot.data[i]['description']),
                      trailing: IconButton(
                        onPressed: () async {
                          supabaseManager.deleteData(snapshot.data![i]['id']);

                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                    //
                    //
                  });
            },
          ),
        ),
      ),
    );
  }
}
