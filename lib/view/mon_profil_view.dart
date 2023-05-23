import 'package:flutter/material.dart';
import 'package:firstapplicationimmm/globale.dart';

class MyProfilView extends StatefulWidget {
  const MyProfilView({Key? key}) : super(key: key);

  @override
  State<MyProfilView> createState() => _MyProfilViewState();
}

class _MyProfilViewState extends State<MyProfilView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //mon avatar
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(moi.avatar ?? imageDefault),
          ),


          // mon nom et prenom
          Text(moi.fullName,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

          //pseudo

          Text(moi.pseudo ?? "",style: const TextStyle(fontStyle: FontStyle.italic),)


          //adresse
        ],
      ),

    );
  }
}
