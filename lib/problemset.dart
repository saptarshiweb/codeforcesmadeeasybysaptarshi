import 'package:codeforces_made_easy/home.dart';
import 'package:codeforces_made_easy/problems.dart';
import 'package:codeforces_made_easy/searching2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Contests extends StatefulWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  _ContestsState createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  Map all = {};
  List allres = [];
  bool isprob = false;

  Future probdata() async {
    http.Response response;
    isprob = true;

    response = await http
        .get(Uri.parse('https://codeforces.com/api/contest.list?gym=false'));

    if (response.statusCode == 200) {
      setState(() {
        isprob = false;
        all = json.decode(response.body);

        allres = all['result'];
      });
    }
  }

  @override
  void initState() {
    probdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple.shade900,
                            Colors.redAccent.shade700,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.orangeAccent.shade400,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GlowText(
                          '   Contests      ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'red',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Searching2(),
                    SizedBox(
                      width: 180,
                    ),
                    ElevatedButton(
                      onPressed: () {

                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Problems()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.limeAccent,
                        onPrimary: Colors.blueAccent,
                        onSurface: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            GlowText(
                              "ProblemSet ",
                              glowColor: Colors.white,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'amita',
                                color: Colors.pinkAccent.shade400,
                              ),
                            ),
                            Icon(
                              Icons.drag_handle_rounded,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {

                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        onPrimary: Colors.redAccent.shade400,
                        onSurface: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            GlowText(
                              "Back To Home ",
                              glowColor: Colors.white,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'amita',
                                color: Colors.blueAccent.shade700,
                              ),
                            ),
                            Icon(
                              Icons.arrow_back,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.orangeAccent.shade100,
                      Colors.white,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GlowText(
                          "Div 1",
                          glowColor: Colors.white,
                          style: TextStyle(
                              color: Colors.deepPurpleAccent.shade700,
                              fontFamily: 'red',
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.deepPurple,
                            ))
                      ],
                    ),
                  ),
                ),
              ),

              //div2
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.lightGreenAccent.shade100,
                    Colors.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GlowText(
                          "Div 2",
                          glowColor: Colors.white,
                          style: TextStyle(
                              color: Colors.redAccent.shade700,
                              fontFamily: 'red',
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.redAccent.shade700,
                            ))
                      ],
                    ),
                  ),
                ),
              ),

              //div3

              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.tealAccent.shade100,
                    Colors.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GlowText(
                          "Div 3",
                          glowColor: Colors.white,
                          style: TextStyle(
                              color: Colors.deepPurpleAccent.shade400,
                              fontFamily: 'red',
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.deepPurpleAccent.shade400,
                            ))
                      ],
                    ),
                  ),
                ),
              ),

              //educational

              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.pinkAccent.shade100,
                    Colors.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GlowText(
                          "Educational",
                          glowColor: Colors.white,
                          style: TextStyle(
                              color: Colors.deepOrangeAccent.shade400,
                              fontFamily: 'red',
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.deepOrangeAccent.shade400,
                            ))
                      ],
                    ),
                  ),
                ),
              ),

              //Others

              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.yellowAccent.shade100,
                    Colors.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GlowText(
                          "Other",
                          glowColor: Colors.white,
                          style: TextStyle(
                              color: Colors.indigoAccent.shade700,
                              fontFamily: 'red',
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.indigoAccent.shade700,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          //DIV 1
          Container(
            child: div1(),
          ),

          //DIV 2
          Container(
            child: div2(),
          ),

          //DIV 3
          Container(
            child: div3(),
          ),

          //educational
          Container(
            child: educational(),
          ),

          //other
          Container(
            child: others(),
          ),
        ]),
      ),
    );
  }

  Widget div2() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.shade200.withOpacity(0.4),
            Colors.yellow.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 0.001, color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: SizedBox(
        height: 400,
        child: Center(
          child: isprob
              ? CircularProgressIndicator(
                color: Colors.pinkAccent.shade400,
                backgroundColor: Colors.indigoAccent.shade400,
              )
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  
                  itemBuilder: (context, index) {
                    double dur1 = allres[index]['durationSeconds'] / 3600;

                    var dur = dur1.toStringAsFixed(2);
                    if ((d2('${allres[index]['name']}') == true) &&
                        ('${allres[index]['phase']}' == 'FINISHED'))
                      return ListTile(
                          title: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    onPrimary: Colors.lightGreenAccent.shade400,
                                    onSurface: Colors.yellowAccent,
                                  ),
                                  child: GlowText(
                                    '${allres[index]['name']}',
                                    glowColor: Colors.yellow.shade100,
                                    style: TextStyle(
                                      color: Colors.orangeAccent.shade700,
                                      fontFamily: 'amita',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Duration

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreenAccent,
                                    onSurface: Colors.redAccent,
                                    onPrimary: Colors.tealAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GlowText(
                                      'Duration :  $dur  hours',
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontFamily: 'red',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //link

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _linkslaunch(
                                        '${allres[index]['id']}'.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.tealAccent.shade100,
                                    onSurface: Colors.deepPurpleAccent,
                                    onPrimary: Colors.blueAccent.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Link ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.redAccent.shade400,
                                            fontFamily: 'fira',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GlowIcon(
                                          Icons.link_rounded,
                                          color: Colors.redAccent,
                                          glowColor: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    else
                      return Container();
                  }),
        ),
      ),
    );
  }

  //div1 widget

  Widget div1() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.shade200.withOpacity(0.4),
            Colors.yellow.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 0.001, color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: SizedBox(
        height: 400,
        child: Center(
          child: isprob
              ? CircularProgressIndicator(color: Colors.pinkAccent.shade400,
                backgroundColor: Colors.indigoAccent.shade400,)
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allres.length,
                  itemBuilder: (context, index) {
                    double dur1 = allres[index]['durationSeconds'] / 3600;

                    var dur = dur1.toStringAsFixed(2);
                    if ((d1('${allres[index]['name']}') == true) &&
                        ('${allres[index]['phase']}' == 'FINISHED'))
                      return ListTile(
                          title: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    onPrimary: Colors.lightGreenAccent.shade400,
                                    onSurface: Colors.yellowAccent,
                                  ),
                                  child: GlowText(
                                    '${allres[index]['name']}',
                                    glowColor: Colors.yellow.shade100,
                                    style: TextStyle(
                                      color: Colors.orangeAccent.shade700,
                                      fontFamily: 'amita',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Duration

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreenAccent,
                                    onSurface: Colors.redAccent,
                                    onPrimary: Colors.tealAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GlowText(
                                      'Duration :  $dur  hours',
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontFamily: 'red',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //link

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _linkslaunch(
                                        '${allres[index]['id']}'.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.tealAccent.shade100,
                                    onSurface: Colors.deepPurpleAccent,
                                    onPrimary: Colors.blueAccent.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Link ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.redAccent.shade400,
                                            fontFamily: 'fira',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GlowIcon(
                                          Icons.link_rounded,
                                          color: Colors.redAccent,
                                          glowColor: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    else
                      return Container();
                  }),
        ),
      ),
    );
  }

  //div3 widget

  Widget div3() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.shade200.withOpacity(0.4),
            Colors.yellow.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 0.001, color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: SizedBox(
        height: 400,
        child: Center(
          child: isprob
              ? CircularProgressIndicator(color: Colors.pinkAccent.shade400,
                backgroundColor: Colors.indigoAccent.shade400,)
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allres.length,
                  itemBuilder: (context, index) {
                    double dur1 = allres[index]['durationSeconds'] / 3600;

                    var dur = dur1.toStringAsFixed(2);
                    if ((d3('${allres[index]['name']}') == true) &&
                        ('${allres[index]['phase']}' == 'FINISHED'))
                      return ListTile(
                          title: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    onPrimary: Colors.lightGreenAccent.shade400,
                                    onSurface: Colors.yellowAccent,
                                  ),
                                  child: GlowText(
                                    '${allres[index]['name']}',
                                    glowColor: Colors.yellow.shade100,
                                    style: TextStyle(
                                      color: Colors.orangeAccent.shade700,
                                      fontFamily: 'amita',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Duration

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreenAccent,
                                    onSurface: Colors.redAccent,
                                    onPrimary: Colors.tealAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GlowText(
                                      'Duration :  $dur  hours',
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontFamily: 'red',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //link

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _linkslaunch(
                                        '${allres[index]['id']}'.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.tealAccent.shade100,
                                    onSurface: Colors.deepPurpleAccent,
                                    onPrimary: Colors.blueAccent.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Link ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.redAccent.shade400,
                                            fontFamily: 'fira',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GlowIcon(
                                          Icons.link_rounded,
                                          color: Colors.redAccent,
                                          glowColor: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    else
                      return Container();
                  }),
        ),
      ),
    );
  }

  //educational widget

  Widget educational() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.shade200.withOpacity(0.4),
            Colors.yellow.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 0.001, color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: SizedBox(
        height: 400,
        child: Center(
          child: isprob
              ? CircularProgressIndicator(color: Colors.pinkAccent.shade400,
                backgroundColor: Colors.indigoAccent.shade400,)
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allres.length,
                  itemBuilder: (context, index) {
                    double dur1 = allres[index]['durationSeconds'] / 3600;

                    var dur = dur1.toStringAsFixed(2);
                    if ((edu('${allres[index]['name']}') == true) &&
                        ('${allres[index]['phase']}' == 'FINISHED'))
                      return ListTile(
                          title: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    onPrimary: Colors.lightGreenAccent.shade400,
                                    onSurface: Colors.yellowAccent,
                                  ),
                                  child: GlowText(
                                    '${allres[index]['name']}',
                                    glowColor: Colors.yellow.shade100,
                                    style: TextStyle(
                                      color: Colors.orangeAccent.shade700,
                                      fontFamily: 'amita',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Duration

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreenAccent,
                                    onSurface: Colors.redAccent,
                                    onPrimary: Colors.tealAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GlowText(
                                      'Duration :  $dur  hours',
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontFamily: 'red',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //link

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _linkslaunch(
                                        '${allres[index]['id']}'.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.tealAccent.shade100,
                                    onSurface: Colors.deepPurpleAccent,
                                    onPrimary: Colors.blueAccent.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Link ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.redAccent.shade400,
                                            fontFamily: 'fira',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GlowIcon(
                                          Icons.link_rounded,
                                          color: Colors.redAccent,
                                          glowColor: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    else
                      return Container();
                  }),
        ),
      ),
    );
  }

  //others widget

  Widget others() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrangeAccent.shade200.withOpacity(0.4),
            Colors.yellow.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 0.001, color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: SizedBox(
        height: 400,
        child: Center(
          child: isprob
              ? CircularProgressIndicator(color: Colors.pinkAccent.shade400,
                backgroundColor: Colors.indigoAccent.shade400,)
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allres.length,
                  itemBuilder: (context, index) {
                    double dur1 = allres[index]['durationSeconds'] / 3600;

                    var dur = dur1.toStringAsFixed(2);
                    if ((oth('${allres[index]['name']}') == true) &&
                        ('${allres[index]['phase']}' == 'FINISHED'))
                      return ListTile(
                          title: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    onPrimary: Colors.lightGreenAccent.shade400,
                                    onSurface: Colors.yellowAccent,
                                  ),
                                  child: customval('${allres[index]['name']}'),
                                ),
                              ),
                            ),

                            //Duration

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreenAccent,
                                    onSurface: Colors.redAccent,
                                    onPrimary: Colors.tealAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GlowText(
                                      'Duration :  $dur  hours',
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontFamily: 'red',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //link

                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _linkslaunch(
                                        '${allres[index]['id']}'.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.tealAccent.shade100,
                                    onSurface: Colors.deepPurpleAccent,
                                    onPrimary: Colors.blueAccent.shade400,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Link ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.redAccent.shade400,
                                            fontFamily: 'fira',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GlowIcon(
                                          Icons.link_rounded,
                                          color: Colors.redAccent,
                                          glowColor: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    else
                      return Container();
                  }),
        ),
      ),
    );
  }

  bool d2(String con) {
    String tem = con.substring(con.length - 8);
    String tem1 = con.substring(0, 11);
    if ((tem == "(Div. 2)") && (tem1 == "Codeforces ")) {
      return true;
    } else
      return false;
  }

  bool oth(String con) {
    String tem = con.substring(0, 11);
    String tem1 = con.substring(0, 11);
    if ((tem != "Educational") && (tem1 != "Codeforces ")) {
      return true;
    } else
      return false;
  }

  bool d1(String con) {
    String tem = con.substring(con.length - 8);
    String tem1 = con.substring(0, 11);
    if ((tem == "(Div. 1)") && (tem1 == "Codeforces ")) {
      return true;
    } else
      return false;
  }

  bool d3(String con) {
    String tem = con.substring(con.length - 8);
    String tem1 = con.substring(0, 11);
    if ((tem == "(Div. 3)") && (tem1 == "Codeforces ")) {
      return true;
    } else
      return false;
  }

  bool edu(String con) {
    String tem = con.substring(0, 11);
    // String tem1 = con.substring(0, 11);
    if ((tem == "Educational")) {
      return true;
    } else
      return false;
  }

  GlowText customval(String s) {
    if (s.length > 50) {
      return GlowText(
        s.substring(0, 51),
        glowColor: Colors.yellow.shade100,
        style: TextStyle(
          color: Colors.orangeAccent.shade700,
          fontFamily: 'amita',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return GlowText(
        s,
        glowColor: Colors.yellow.shade100,
        style: TextStyle(
          color: Colors.orangeAccent.shade700,
          fontFamily: 'amita',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  void _linkslaunch(String id) async =>
      await canLaunch("https://codeforces.com/contest/$id")
          ? await launch("https://codeforces.com/contest/$id")
          : throw 'Could not launch ';
}
