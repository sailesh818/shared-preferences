import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();

  // ignore: constant_identifier_names
  static const String KEYNAME = "name";
  String nameVlue = "No vlue saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // ignore: unused_local_variable
                var name = nameController.text;
                // ignore: unused_local_variable
                var prefs = await SharedPreferences.getInstance();
                //prefs.setString(KEYNAME, nameController.text.toString());
                await prefs.setString(KEYNAME, name);
                getValue();
              },
              child: Text('Save'),
            ),
            SizedBox(height: 25),
            Text(nameVlue),
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    //nameVlue = getName != null ? getName : "No value";

    setState(() {
      nameVlue = getName ?? "No value";
    });
  }
}
