import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firstapplicationimmm/controller/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:firstapplicationimmm/globale.dart';

class MyProfilView extends StatefulWidget {
  const MyProfilView({Key? key}) : super(key: key);

  @override
  State<MyProfilView> createState() => _MyProfilViewState();
}

class _MyProfilViewState extends State<MyProfilView> {
  //variables
  String? urlImage;
  String? nameImage;
  Uint8List? datasImage;
  
  
  //fonctions
  popImage(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Enregistrement de l'image"),
            content: Image.memory(datasImage!),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Non")),
              TextButton(onPressed: (){
                FirebaseHelper().uploadImage("profil/${moi.id}", nameImage!, datasImage!).then((value){
                  setState(() {
                    moi.avatar = value;
                    Map<String,dynamic> map = {
                      "AVATAR":moi.avatar
                    };
                    FirebaseHelper().updateUser(moi.id, map);
                    Navigator.pop(context);
                  });
                });
                
              }, child: const Text("Oui")),
            ],
          );
        }
    );
  }
  ImagePopUp()async{

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true
    );
    if(result != null){
      nameImage = result.files.first.name;
      datasImage = result.files.first.bytes;
      popImage();
    }
    

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //mon avatar
          InkWell(
            onTap: (){
              ImagePopUp();
            },
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(moi.avatar ?? imageDefault),
            ),
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
