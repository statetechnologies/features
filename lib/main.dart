import 'package:features/Features/HStepper.dart';
import 'package:features/Features/OTP.dart';
import 'package:features/Features/videoStream.dart';
import 'package:flutter/material.dart';

import 'Features/Shimmer.dart';
import 'Features/Sms.dart';
import 'Features/Stepper.dart';
import 'Features/appbarDissappear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));
            }, child: Text('OTP')),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
            }, child: Text('Stepper')),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>myShimmer()));
            }, child: Text('Shimmer')),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ScrollScreen()));
            }, child: Text('AppBar')),
            OutlinedButton(onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>SmsTest()));
            }, child: Text('Sms')),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HStepper()));
            }, child: Text('HStepper')),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoStreamScreen()));
            }, child: Text('Video Stream')),
          ],
        ),
      ),
    );
  }
}
