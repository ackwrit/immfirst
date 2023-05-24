import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //attributs
  late String id;
  late String nom;
  late String prenom;
  String? pseudo;
  late String mail;
  String? avatar;
  List? favoris;


  //contsructeurs
  Utilisateur(){
    id = "";
    nom= "";
    prenom ="";
    mail = "";
    favoris = [];
  }

  Utilisateur.firebase(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map ["PRENOM"];
    pseudo = map["PSEUDO"];
    mail = map["MAIL"];
    avatar = map["AVATAR"];
    List? tempo = map["FAVORIS"];
    if(tempo == null){
      favoris = [];
    }
    else {
      favoris = tempo;
    }



  }




  //méthode

  String get fullName {
    return prenom + " "+ nom;
  }
}