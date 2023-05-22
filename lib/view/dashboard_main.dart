import 'package:flutter/material.dart';

class DashBoardMain extends StatefulWidget {
  const DashBoardMain({Key? key}) : super(key: key);

  @override
  State<DashBoardMain> createState() => _DashBoardMainState();
}

class _DashBoardMainState extends State<DashBoardMain> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Je suis dans la nouvelle page"),
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
