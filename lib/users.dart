import 'package:codeforces_made_easy/about.dart';
import 'package:codeforces_made_easy/filteruser.dart';
import 'package:codeforces_made_easy/problemset.dart';
import 'package:codeforces_made_easy/searching.dart';
import 'package:flutter/material.dart';



import 'package:flutter_glow/flutter_glow.dart';

import 'home.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var use = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [
              //   Colors.deepPurple.shade900,
              //   Colors.yellow,

              //   Colors.black,
              //   Colors.orange,
              //   Colors.lightBlueAccent
              // ])

              image: DecorationImage(
                  image: AssetImage("assets/pexels-negative-space-34153.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: GlowButton(
                      onPressed: () {},
                      width: 500,
                      height: 70,
                      // color: Color(0xFF0E3311).withOpacity(0.1),

                      border: Border.all(
                          width: 5, color: Colors.white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),

                      color: Colors.black,
                      glowColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GlowText(
                          "Codeforces Personaliser",
                          glowColor: Colors.red[900],
                          style: TextStyle(
                            fontFamily: "ale",
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // tabs

                  //Home

                  SizedBox(
                    width: 180,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: GlowButton(
                      onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      },
                      width: 100,
                      height: 40,
                      color: Colors.white.withOpacity(1),
                      glowColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GlowText(
                          "Home",
                          glowColor: Colors.white,
                          style: TextStyle(
                            fontFamily: "ale",
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Contest Tab

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: GlowButton(
                      onPressed: () {


                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contests()));
                      },
                      width: 150,
                      height: 40,
                      color: Colors.white,
                      glowColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: GlowText(
                          "Contests",
                          glowColor: Colors.white,
                          style: TextStyle(
                            fontFamily: "ale",
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Users Tab

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: GlowButton(
                      onPressed: () {},
                      width: 130,
                      height: 40,
                      color: Colors.white,
                      glowColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: GlowText(
                          "Users",
                          glowColor: Colors.white,
                          style: TextStyle(
                            fontFamily: "ale",
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 8, 0),
                    child: GlowButton(
                      onPressed: () {

                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()));
                      },
                      width: 125,
                      height: 40,
                      color: Colors.white,
                      glowColor: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 10, 1),
                        child: GlowText(
                          "About",
                          glowColor: Colors.white,
                          style: TextStyle(
                            fontFamily: "ale",
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  GlowText(
                    "Users -----",
                    glowColor: Colors.blueAccent[700],
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "red",
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GlowText(
                    "Filter Users with their username.\nYou can choose multiple users or Single.",
                    glowColor: Colors.lightGreenAccent[700],
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "red",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                  ),

                  Searching(),
                  

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 10,
                color: Colors.yellow.shade900,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 4, 10, 7),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box_outlined,
                      color: Colors.purple,
                    ),
                    GlowText(
                      'Username',
                      glowColor: Colors.yellow,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Container(
                      color: Colors.lightGreenAccent[400],
                      height: 28,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Icon(
                      Icons.people_sharp,
                      color: Colors.indigoAccent,
                    ),
                    GlowText(
                      'Name',
                      glowColor: Colors.yellow,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 105,
                    ),
                    Container(
                      color: Colors.lightGreenAccent[400],
                      height: 28,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Icon(
                      Icons.school,
                      color: Colors.yellowAccent,
                    ),
                    GlowText(
                      'Organization',
                      glowColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 41,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 28,
                      width: 4,
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    Icon(
                      Icons.price_check,
                      color: Colors.red[400],
                    ),
                    GlowText(
                      'Rank',
                      glowColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 138,
                    ),
                    Container(
                      color: Colors.lightGreenAccent[400],
                      height: 28,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Icon(
                      Icons.score,
                      color: Colors.teal,
                    ),
                    GlowText(
                      'MaxRating',
                      glowColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      color: Colors.lightGreenAccent[400],
                      height: 28,
                      width: 4,
                    ),

                    SizedBox(
                      width: 18,
                    ),

                    //photo tab
                    ///   .....
                    ///
                    ///

                    Icon(
                      Icons.photo,
                      color: Colors.lightGreenAccent[400],
                    ),
                    GlowText(
                      'Photo',
                      glowColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'om',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 78,
                    ),
                    Container(
                      color: Colors.white,
                      height: 28,
                      width: 4,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 4,
                height: 20,
                indent: 60,
                endIndent: 60,
                color: Colors.yellow,
              ),
              Filter(),
              SizedBox(
                height: 200,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
