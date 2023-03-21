import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/servises/model.dart';
import 'package:flutter_application_2/servises/servises.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;
  bool sign = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DBConnection dbConnection = new DBConnection();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Column(
              children: [ 
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 120)),
                const Text("Kamil app  ", style: TextStyle(color: Colors.orange, fontSize: 30)),
                Image.asset("assets/clown.png"),],),
            SizedBox(
                height: 100, width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: email,
                  decoration: 
                  InputDecoration(
                    label: const Text("Email"),
                    labelStyle: const TextStyle(color: Colors.orange),
                  prefixIcon: 
                  const Icon(Icons.email, color: Colors.yellow), 
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.orange)
                    )
                    ),
                  cursorColor: Colors.orange,
                  ),
              ),
              SizedBox(
                height: 100, width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: 
                  InputDecoration(
                    label: const Text("Password"),
                  labelStyle: const TextStyle(color: Colors.orange),
                  prefixIcon: 
                  const Icon(Icons.email, color: Colors.yellow), 
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.orange)
                    )
                    ),
                  cursorColor: Colors.orange,

                  ),
              ),
              
                SizedBox(
                  height: 50,
                  //width: 300,
                //height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                  onPressed: () async {

                    if(sign == false){
                      UserModel? user = await dbConnection.signIn(email.text, password.text);
                      if(user != null){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>  HomePage()));
                      }
                    }
                    else{
                      UserModel? user = await dbConnection.signUp(email.text, password.text);
                    }
                  },
                  child: sign? const Text("Sign in"): const Text("Sign up"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                onTap:(){
                  setState(() {
                    sign = !sign;
                  });
                },

                child: const Text(
                  "Sign Up?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              InkWell(
                onTap: (){
                  setState(() {
                    sign = !sign;
                  });
                },
                child: Text(
                    "Sign In?", 
                  style: TextStyle(color: Color.fromARGB(170, 255, 255, 255), fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 14),
                  ),
              ),
              ],
            ),
            
          ],
        ),
      ),

    );
  }
}
