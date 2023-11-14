import 'package:flutter/material.dart';
import 'package:act3_6/screen/media_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UDG Act. 3.6"),
        actions: <Widget> [
          IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Material()),
            const ListTile ( 
                title: Text("Registrarse"),
                trailing: Icon(Icons.access_alarm_outlined),
            ),
            const Divider(
              height: 5.0,
            ),
            ListTile ( 
                title: const Text("Cerrar"),
                trailing: const Icon(Icons.close),
                onTap: () => {
                    Navigator.of(context).pop()
                  },
            ),
          ]
        )
      ),
      body: PageView(
        children: const [
          MediaList()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Populares"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Proximamente"),
          BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Mejor valoradas"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],  

        onTap: (value) {
          _selectedIndex = value;
        },
      ),
    );

  }
}