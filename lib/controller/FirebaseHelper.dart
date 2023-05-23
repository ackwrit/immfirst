import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapplicationimmm/model/Utilisateur.dart';

class FirebaseHelper {
  //attributs
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final storage = FirebaseStorage.instance;


  //méthodes
   Future<Utilisateur>inscription(String nom, String prenom, String mail, String password) async {
     UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
     String uid = resultat.user!.uid;
     Map<String,dynamic> map = {
       "NOM":nom,
       "PRENOM":prenom,
       "MAIL":mail
     };
     addUser(uid, map);
     return getIdenfiant(uid);



   }

   addUser(String uid , Map<String,dynamic> map){
     cloudUsers.doc(uid).set(map);
   }
   updateUser(String uid, Map<String,dynamic> map){
     cloudUsers.doc(uid).update(map);
   }


    Future<Utilisateur> connexion(String mail , String password) async {
     UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
    String uid = resultat.user!.uid;
    return getIdenfiant(uid);



   }

   Future<Utilisateur> getIdenfiant(String id) async {
     DocumentSnapshot snapshot = await cloudUsers.doc(id).get();
     return Utilisateur.firebase(snapshot);

   }

   //uplodaImage
  Future<String>uploadImage(String dossier,String name,Uint8List datas) async{
     TaskSnapshot snapshot = await storage.ref("$dossier/$name").putData(datas);
     String url = await snapshot.ref.getDownloadURL();
     return url;

   }







}