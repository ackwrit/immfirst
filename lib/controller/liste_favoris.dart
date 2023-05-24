import 'package:flutter/material.dart';

class ListFavoris extends StatefulWidget {
  const ListFavoris({Key? key}) : super(key: key);

  @override
  State<ListFavoris> createState() => _ListFavorisState();
}

class _ListFavorisState extends State<ListFavoris> {
  @override
  Widget build(BuildContext context) {
    return Text("Afficher Les favoris");
  }
}
