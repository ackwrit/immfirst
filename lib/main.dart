import 'package:firstapplicationimmm/controller/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
 TextEditingController mailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          children: <Widget>[
            //image
            Image.asset("assets/samurai.jpg"),
            const SizedBox(height: 10),

            //adresse mail
            TextField(
              controller: mailController,
                decoration : InputDecoration(
                    hintText : "Entrer votre mail",
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                )
            ),
            const SizedBox(height: 10),


            //password

            TextField(
              controller: passwordController,
                obscureText : true,
                decoration : InputDecoration(
                    hintText : "Entrer votre paswword",
                    border : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                )
            ),
            const SizedBox(height: 10),

            //inscription
            ElevatedButton(
                onPressed: (){
                  print("Inscription");
                  FirebaseHelper().inscription("", "", mailController.text, passwordController.text);

                },
                child : const Text("Inscription")
            ),

            const SizedBox(height: 10),

            //Connexion
            ElevatedButton(
                onPressed: (){
                  print("Connxion");

                },
                child : const Text("Connexion")
            ),


          ],
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
