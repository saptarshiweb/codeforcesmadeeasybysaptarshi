import 'package:codeforces_made_easy/problems.dart';
import 'package:codeforces_made_easy/problemset.dart';
import 'package:codeforces_made_easy/users.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_glow/flutter_glow.dart';

import 'dart:convert';

import 'about.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var fin = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //           bottom: Radius.circular(20), top: Radius.circular(25))),
      //   backgroundColor: Colors.transparent,
      //   title: GlowText(
      //     "Codeforces Personaliser",
      //     style: TextStyle(
      //       fontFamily: "sig",
      //       fontSize: 40,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),

      // drawer: Drawer(
      //   child: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [
      //           Colors.orangeAccent,
      //           Colors.teal,
      //           Colors.white70,
      //           Colors.deepPurple,
      //         ])),
      //     width: double.infinity,
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: 200,
      //         ),
      //         GlowButton(
      //             child: Text(
      //               "Home",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //             onPressed: () {})
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/pexels-junior-teixeira-2047905.jpg'),
                fit: BoxFit.cover),
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [
            //   Colors.deepOrange,
            //   Colors.blueGrey,
            //   Colors.purple,
            // ])
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child: GlowText(
                          'Codeforces Personaliser',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "red",
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // tabs

                  SizedBox(
                    width: 130,
                  ),

                  //home Tab

                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.greenAccent[700],
                      ),
                      child: Container(
                        child: Center(
                          child: GlowText(
                            "Home",
                            glowColor: Colors.white.withOpacity(0.8),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.overline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.deepOrange,
                              decorationThickness: 8,
                              fontFamily: 'red',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 18,
                  ),

                  //Contest Tab

                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contests()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.red[900],
                      ),
                      child: Container(
                        child: Center(
                          child: GlowText(
                            "Contests",
                            glowColor: Colors.white.withOpacity(0.8),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.overline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.teal,
                              decorationThickness: 8,
                              fontFamily: 'red',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),

                  //Users Tab

                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Users()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.lightBlueAccent[700],
                      ),
                      child: Container(
                        child: Center(
                          child: GlowText(
                            "Users",
                            glowColor: Colors.white.withOpacity(0.4),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.overline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.lightGreenAccent[400],
                              decorationThickness: 8,
                              fontFamily: 'red',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),

                  //practice tab

                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Problems()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.pinkAccent[400],
                      ),
                      child: Container(
                        child: Center(
                          child: GlowText(
                            "Practice",
                            glowColor: Colors.white.withOpacity(0.8),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.overline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.greenAccent,
                              decorationThickness: 8,
                              fontFamily: 'red',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 18,
                  ),

                  //About tab

                  InkWell(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.pinkAccent[400],
                      ),
                      child: Container(
                        child: Center(
                          child: GlowText(
                            "About",
                            glowColor: Colors.white.withOpacity(0.8),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.overline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.yellowAccent,
                              decorationThickness: 8,
                              fontFamily: 'red',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Image.asset(
                    'cf.png',
                    height: 60,
                    width: 400,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DelayedDisplay(
                    delay: Duration(seconds: 1),
                    child: GlowText(
                      "The Codeforces Personaliser is finally here !!!! \nNow you can view all the users and contests at the particular place . ",
                      glowColor: Colors.white,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "red",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 38,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Problems()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        onSurface: Colors.deepOrangeAccent.shade200,
                        onPrimary: Colors.red,
                        shadowColor: Colors.yellowAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GlowText(
                              "Problemset:",
                              style: TextStyle(
                                fontFamily: 'red',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent.shade400,
                              ),
                            ),
                            GlowIcon(
                              Icons.question_answer_sharp,
                              color: Colors.deepPurpleAccent,
                              glowColor: Colors.indigoAccent,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.shade400,
                      onSurface: Colors.blueAccent.shade700,
                      onPrimary: Colors.deepPurpleAccent.shade700,
                      shadowColor: Colors.yellowAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GlowText(
                        "Explore Problems from the problemset , or check out some blogs of brilliant authors !!!!\nChoose any of the users below to see their blogs. ",
                        glowColor: Colors.blue,
                        style: TextStyle(
                          fontFamily: 'red',
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.lightGreenAccent.shade400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        onPrimary: Colors.black,
                        onSurface: Colors.limeAccent.shade700,
                      ),
                      child: Container(
                        height: 350,
                        width: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fin = 'errichto';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent,
                                  onPrimary: Colors.blueAccent.shade700,
                                  onSurface: Colors.blue.shade900,
                                ),
                                child: Row(
                                  children: [
                                    GlowText(
                                      "Errichto ",
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.pinkAccent.shade400,
                                        fontSize: 20,
                                        fontFamily: 'amita',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Errichto

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fin = 'tourist';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent,
                                  onPrimary: Colors.blueAccent.shade700,
                                  onSurface: Colors.blue.shade900,
                                ),
                                child: Row(
                                  children: [
                                    GlowText(
                                      "Tourist ",
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.pinkAccent.shade400,
                                        fontSize: 20,
                                        fontFamily: 'amita',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fin = '1-gon';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent,
                                  onPrimary: Colors.blueAccent.shade700,
                                  onSurface: Colors.blue.shade900,
                                ),
                                child: Row(
                                  children: [
                                    GlowText(
                                      "1-gon ",
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.pinkAccent.shade400,
                                        fontSize: 20,
                                        fontFamily: 'amita',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fin = 'Radewoosh';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent,
                                  onPrimary: Colors.blueAccent.shade700,
                                  onSurface: Colors.blue.shade900,
                                ),
                                child: Row(
                                  children: [
                                    GlowText(
                                      "Radewoosh ",
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.pinkAccent.shade400,
                                        fontSize: 20,
                                        fontFamily: 'amita',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fin = 'Ecnerwala';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent,
                                  onPrimary: Colors.blueAccent.shade700,
                                  onSurface: Colors.blue.shade900,
                                ),
                                child: Row(
                                  children: [
                                    GlowText(
                                      "Ecnerwala ",
                                      glowColor: Colors.white,
                                      style: TextStyle(
                                        color: Colors.pinkAccent.shade400,
                                        fontSize: 20,
                                        fontFamily: 'amita',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 350,
                    width: 940,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.white,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: printblog(),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  Container printblog() {
    if (fin == '')
      return Container(
        child: Center(
          child: GlowText(
            '      No author selected , Please select one of the authors to\n               view their blogs !!!',
            style: TextStyle(
                color: Colors.deepPurple.shade900,
                fontFamily: 'amita',
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    else
      return Container(
        child: Blogsprint(user: fin),
      );
  }
}

//new Stateful Widget for blogs

class Blogsprint extends StatefulWidget {
  final user;
  Blogsprint({required this.user});

  @override
  _BlogsprintState createState() => _BlogsprintState(user);
}

class _BlogsprintState extends State<Blogsprint> {
  String user;

  _BlogsprintState(this.user);

  Map blog = {};
  List blogres = [];

  bool isblog = false;

  Future blogdata() async {
    isblog = true;
    http.Response response;

    response = await http.get(
        Uri.parse('https://codeforces.com/api/user.blogEntries?handle=$user'));

    if (response.statusCode == 200) {
      setState(() {
        isblog = false;
        blog = json.decode(response.body);

        blogres = blog['result'];
      });
    }
  }

  @override
  void initState() {
    blogdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: isblog
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: blogres.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.lightGreenAccent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: Colors.white, width: 0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          GlowText(
                            'Author : ${blogres[index]['authorHandle']}',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'red',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GlowText(
                            '${blogres[index]['title']}'.substring(
                                3, '${blogres[index]['title']}'.length - 4),
                            glowColor: Colors.white,
                            style: TextStyle(
                              color: Colors.blueAccent.shade400,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'amita',
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                           padding: const EdgeInsets.fromLTRB(320, 0, 320, 0),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreenAccent.shade100,
                                  onPrimary: Colors.greenAccent,
                                  onSurface: Colors.orangeAccent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      GlowText(
                                        'View in Full ',
                                        glowColor: Colors.white,
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent.shade400,
                                          fontFamily: 'amita',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GlowButton(
                                          color: Colors.white,
                                          glowColor: Colors.teal.shade200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              'Click',
                                              style: TextStyle(
                                                color:
                                                    Colors.deepOrange.shade400,
                                                fontSize: 18,
                                                fontFamily: 'mark',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {})
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
