import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //attributs
  late String id;
  late String nom;
  late String prenom;
  String? pseudo;
  late String mail;
  String? avatar;


  //contsructeurs
  Utilisateur(){
    id = "";
    nom= "";
    prenom ="";
    mail = "";
  }

  Utilisateur.firebase(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map ["PRENOM"];
    pseudo = map["PSEUDO"];
    mail = map["MAIL"];
    avatar = map["AVATAR"];

  }




  //méthode
}