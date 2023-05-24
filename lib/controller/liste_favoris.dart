import 'package:firstapplicationimmm/controller/FirebaseHelper.dart';
import 'package:firstapplicationimmm/globale.dart';
import 'package:firstapplicationimmm/model/Utilisateur.dart';
import 'package:flutter/material.dart';

class ListFavoris extends StatefulWidget {
  const ListFavoris({Key? key}) : super(key: key);

  @override
  State<ListFavoris> createState() => _ListFavorisState();
}

class _ListFavorisState extends State<ListFavoris> {
  List mesFavoris = [];

  conversionTableau(){
    for(int i =0;i<moi.favoris!.length;i++){
      FirebaseHelper().getIdenfiant(moi.favoris![i]).then((value) {
        mesFavoris.add(value);
      });

    }
  }
  @override
  void initState() {
    conversionTableau();
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount:mesFavoris.length ,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 2),
      itemBuilder: (context ,index){
          Utilisateur user = mesFavoris[index];
          return Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(user.avatar ?? imageDefault),
                fit: BoxFit.fill
              )


            ),
            child: Center(child: Text(user.mail,style: const TextStyle(color: Colors.purpleAccent),)),
          );

      },
    );



  }
}
