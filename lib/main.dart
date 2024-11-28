
import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screen/favorite_screen.dart';
import 'package:wisata_candi/screen/home_screen.dart';
import 'package:wisata_candi/screen/profile_screen.dart';
import 'package:wisata_candi/screen/search_screen.dart';
import 'package:wisata_candi/screen/sign_in_screen.dart';
import 'package:wisata_candi/screen/sign_up_screen.dart';
import 'screen/detail_screen.dart';
import 'package:wisata_candi/screen/profile_screen.dart';
import 'package:wisata_candi/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.deepPurple),
              titleTextStyle: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
            primary: Colors.deepPurple,
            surface: Colors.deepPurple[50],
          ),
          useMaterial3: true),
      //home: const HomeScreen(),
      home: const SignUpScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      }
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO: 1. Deklarasikan variabel
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.deepPurple,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.deepPurple,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
        //TODO: 2. Buat properti body berupa widget yang ditampilkan
        
        //TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme
        //TODO: 4. Buat data dan child dari Theme
      ),
    );
  }
}
