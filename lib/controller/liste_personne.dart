import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationimmm/controller/FirebaseHelper.dart';
import 'package:firstapplicationimmm/globale.dart';
import 'package:firstapplicationimmm/model/Utilisateur.dart';
import 'package:flutter/material.dart';


class ListPersonne extends StatefulWidget {
  const ListPersonne({Key? key}) : super(key: key);

  @override
  State<ListPersonne> createState() => _ListPersonneState();
}

class _ListPersonneState extends State<ListPersonne> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseHelper().cloudUsers.snapshots(),
        builder: (context,snap){
          List? documents = snap.data?.docs;
          if(documents == null){
            return const CircularProgressIndicator.adaptive();
          }
          else
            {
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context,index){
                  Utilisateur user = Utilisateur.firebase(documents[index]);
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5.0,
                    color: Colors.purple,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user.avatar ?? imageDefault),
                      ),
                      title: Text(user.fullName),
                      subtitle: Text(user.mail),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: (){
                          print("coucou");
                        },
                      ),
                    ),
                  );
                },

              );
            }

        }
    );
  }
}
