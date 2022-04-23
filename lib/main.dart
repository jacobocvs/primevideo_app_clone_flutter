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
                        height: 220.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/thebatman.jpg',
                            ),
                          fit: BoxFit.fill
                          )
                        )
                      ),
                      Positioned(
                          child: Row(
                            children: <Widget>[
                              DotsIndicator(
                                mainAxisAlignment: MainAxisAlignment.center,
                                dotsCount: 4,
                              )
                        ],
                      ))
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