import 'package:art_exhibition/routes/routes.dart';
import 'package:art_exhibition/utilities/device_info.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';

@Todo("""
Issues: 
1- arts screen state update problem: state of arts view contex must update itself after selecting chips! 
2- in Settings view, password and username change pages not done yet!
3- 


""")
void main() async {
  await DeviceInfo.getInfo.then((value) {
    //print(value.getInfo().data);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Exhibition',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(color: Colors.transparent, elevation: 0.0),
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}
