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
    final List<String> imageList = [
      'assets/images/blotted Lips.jpeg',
      'assets/images/Colourop-Lippie-Pencil.jpg',
      'assets/images/images.jpeg',
      'assets/images/No Filter.jpeg',
      'assets/images/IPhone.jpeg',
      'assets/images/Android_Phone.jpg',
    ];
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
      body: Container(
        //color: Colors.grey,
        margin: EdgeInsets.all(2.0),
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
                        Icon(Icons.grid_view),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              
              child: GridView.builder(
                //padding: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        
                      ),
                      
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.fitHeight,
                        
                        //color: Colors.amber,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Icon(
                            Icons.favorite_border,
                            fontWeight: FontWeight.bold,
                            ),
*/