import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:todo18/done.dart';
import 'home_page.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}
// ignore: unused_element
int _currentIndex = 0;
class _RootPageState extends State<RootPage> {
   
  int currentpage = 0;
  List<Widget> pages = const [HomePage(), DonePage(completedTask: '',)];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
     
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentpage,
        // ignore: no_leading_underscores_for_local_identifiers
        onTap: (int _index) => setState(() => currentpage=  _currentIndex = _index),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.done_all),
            title: const Text("Finshed tasks"),
            selectedColor: Colors.pink,
          ),
        ],
        
      ),
    );
  }
}
