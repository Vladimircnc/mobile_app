import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dostavka_Screen.dart';
import 'prodaja_Screen.dart';
import 'skupka_Screen.dart';

void main() => runApp(MaterialApp(home: MainApp()));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0; // Добавляем состояние для текущего индекса
  void onBottomNavItemTap(index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DostavkaScreen()),
      );
    }

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) { return ProdajaScreen(); }),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SkupkaScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: 
FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(60.003565, 30.329334),
            initialZoom: 13.0,
            maxZoom: 8,
             onTap: (tapPosition, latLng) {
          print('Tapped at: $latLng');}
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              subdomains: ['a', 'b', 'c'],
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution('OpenStreetMap contributors'),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(60.003565, 30.329334),
                  width: 80.0,
                  height: 80.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 40.0),
                      SizedBox(height: 4.0),
                      Text(
                        'Санкт-Петербург,\nулица энгельса 23',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ), ), ], ) ), ], ), ], ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 179, 219),
        title: Text('TraidCompany'),
        centerTitle: true,
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onBottomNavItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'доставка',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'продажа'),
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'скупка'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {     print("click");    }  ,
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
