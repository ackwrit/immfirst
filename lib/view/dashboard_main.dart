import 'package:firstapplicationimmm/controller/liste_favoris.dart';
import 'package:firstapplicationimmm/controller/liste_personne.dart';
import 'package:firstapplicationimmm/view/mon_profil_view.dart';
import 'package:flutter/material.dart';

class DashBoardMain extends StatefulWidget {
  String pass;

  DashBoardMain({Key? key, required this.pass}) : super(key: key);

  @override
  State<DashBoardMain> createState() => _DashBoardMainState();
}

class _DashBoardMainState extends State<DashBoardMain> {
  int index = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width*0.5,
        color: Colors.purple,
        child: const MyProfilView(),
      ),
      appBar: AppBar(),
      body: PageView(
        controller: pageController,
        onPageChanged: (value){
          setState(() {
            index = value;
          });
        },
        children: [
          ListPersonne(),
          ListFavoris(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value){
          setState(() {
            index = value;
            pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
          });

        },
        items: const [
          BottomNavigationBarItem(
            label: 'Liste',
              icon: Icon(Icons.list)
          ),
          BottomNavigationBarItem(
            label: 'Favoris',
              icon: Icon(Icons.favorite)
          )
        ],

      ),
    );
  }
}
