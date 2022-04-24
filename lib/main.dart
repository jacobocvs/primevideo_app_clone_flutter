import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Prime video clone';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

int photoIndex = 0;

List<String> photos = [
  'assets/images/thebatman.jpg',
  'assets/images/eam.jpg',
  'assets/images/w.jpg',
  'assets/images/lj.jpg',
];
  List<String> photosM = [
  'assets/images/theoffice.jpg',
  'assets/images/tb.jpg',
  'assets/images/hov.jpg',
  'assets/images/in.jpg',
  'assets/images/tgd.jpg',
  'assets/images/jbn.jpg',
  'assets/images/jwk.jpg',
];

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121923),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                title: Text ('Prime video clone'),
                centerTitle: true,
                backgroundColor: Color (0xFF121923),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'TV Shows'),
                    Tab(text: 'Movies'),
                    Tab(text: 'Kids'),
                  ],
                ),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: <Widget> [
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(photos[photoIndex],
                            ),
                          fit: BoxFit.fill
                          )
                        )
                      ),
                      Positioned(
                        top: 110,
                          left: 200,
                          child: Row(
                            children: <Widget>[
                              DotsIndicator(
                                dotsCount: photos.length,
                                decorator: const DotsDecorator(
                                  color: Colors.white,
                                  activeColor: Colors.blueAccent
                              )
                              )
                            ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 180.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                                    child: Text('Seguir viendo', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0
                                    ),
                                    ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 110.0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: photos.length,
                                    itemBuilder: (BuildContext context, int index)  {
                                      return Container(
                                        width: 140.0,
                                        child: Card(
                                          child: Image.asset(photosM[index],
                                          fit: BoxFit.fill,),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      )
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Channels', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'My profile', backgroundColor: Colors.black)
        ],
      ),
    );
  }
}