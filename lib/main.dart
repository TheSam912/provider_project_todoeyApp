import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                int i = await DataBaseHelper.instance
                    .insert({DataBaseHelper.columnName: 'sobhan'});

                print('the inseted id is $i');
              },
              child: Text("insert"),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () async {
                List<Map<String, dynamic>> quaryRows =
                    await DataBaseHelper.instance.queryAll();
                print(quaryRows);
              },
              child: Text("query"),
              color: Colors.amber,
            ),
            MaterialButton(
              onPressed: () async {
                int updateId = await DataBaseHelper.instance.update({
                  DataBaseHelper.columnid: 2,
                  DataBaseHelper.columnName: 'Jasem'
                });
                print("Success");
              },
              child: Text("update"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () async {
                int rowsEffected = await DataBaseHelper.instance.delete(2);
                print(rowsEffected);
              },
              child: Text("delete"),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
