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
      body: Text("${widget.pass}"),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value){
          setState(() {
            index = value;
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
