import 'package:flutter/material.dart';
import 'clavier.dart';
import 'favori.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApphome(),
    );
  }
}

class MyApphome extends StatefulWidget {
  @override
  _MyApphome createState() => _MyApphome();
}

class _MyApphome extends State<MyApphome> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Favori(),
    Text('Récent Page'),
    Text('Contacts Page'),
    ClavierApp(),
    Text('Messagerie Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget methodapp(IconData icon, String methodname) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onTapIcon(icon);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
            ),
            SizedBox(height: 4),
            Text(
              methodname,
              style: TextStyle(
                fontSize: 8,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  void onTapIcon(IconData icon) {
    switch (icon) {
      case Icons.star:
        break;
      case Icons.alarm:
        break;
      case Icons.contact_emergency:
        break;
      case Icons.keyboard:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClavierApp()),
        );
        break;
      case Icons.message:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Récent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: 'Clavier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messagerie',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
