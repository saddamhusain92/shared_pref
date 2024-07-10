import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uix/provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void setPref()async{
   // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an integer value to 'counter' key.
await prefs.setInt('counter', 30);
// Save an boolean value to 'repeat' key.
await prefs.setBool('repeat', true);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPref();
  }
  @override  
  Widget build(BuildContext context) {
   final myProvider = Provider.of<CartProvider>(context); 
   print(myProvider.name);
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: getPref, child: Text("get data")))
    );
  }

  void getPref()async{
       // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
print(counter);
  }
}