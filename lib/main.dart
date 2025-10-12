import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart_sharp), onPressed: () {}),
        ],
      ),
      body: Row(
        children: [
          
          Container(
            //color: Colors.red,
            
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  "SHOPX",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  //color: Colors.amber,
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 125)),
                      Icon(Icons.menu),
                    ],
                  ),
                ),
                Container(
                  //color: Colors.blueGrey,
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 22.5)),
                      Icon(Icons.grid_view),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ],
      ),
    );
  }
}