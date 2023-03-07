import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_store/home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> items = [];

  Future<List<dynamic>> getItems() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  void initState() {
    super.initState();
    getItems().then((data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Settings'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Align(
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      color: Color.fromRGBO(0, 0, 0, 1),
                      iconSize: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.078),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const TextField(
                        cursorColor: Color.fromARGB(255, 31, 108, 114),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xff8f8f91),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Special offers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 27, 27, 27),
              ),
            ),
            const Text(
              'The best prices',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 51, 51, 51),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image:
                                  NetworkImage(items[index]['image'] as String),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index]['title'] as String,
                                style: const TextStyle(fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  buildStarRating(
                                    items[index]['rating']['rate'] as double,
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '\$ ${items[index]['price'].toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: const Icon(Icons.favorite_border),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 31, 108, 114),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {},
        child: const SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildStarRating(double rating) {
    final stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      if (i <= rating) {
        // Full Star
        stars.add(
          const Icon(
            Icons.brightness_1_rounded,
            color: Colors.orange,
            size: 10,
          ),
        );
      } else if (i - rating < 1) {
        // Half Star
        stars.add(
          const Icon(
            Icons.brightness_1_rounded,
            color: Colors.orange,
            size: 10,
          ),
        );
      } else {
        // Empty Star
        stars.add(
          const Icon(
            Icons.brightness_1_rounded,
            color: Color.fromARGB(255, 201, 200, 200),
            size: 10,
          ),
        );
      }
    }
    return Row(children: stars);
  }
}
