import 'package:flutter/material.dart';



import 'package:flutter_glow/flutter_glow.dart';

import 'package:codeforces_made_easy/problemfind.dart';



import 'home.dart';

class Problems extends StatefulWidget {
  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 15,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                // IconButton(
                //   onPressed: () {

                //     Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => Home()),
                //         );
                //   },
                //   icon: Icon(
                //     Icons.arrow_back_rounded,
                //     color: Colors.white,
                //   ),
                //   focusColor: Colors.blueAccent,
                //   hoverColor: Colors.pink,
                //   splashRadius: 38,
                //   iconSize: 30,
                // ),
                GlowText(
                  'ProblemSet ',
                  style: TextStyle(
                    fontFamily: 'amita',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      // Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.94),
                      Colors.white,
                    ]),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        GlowText(
                          'Popular Problem Tags are Given ',
                          glowColor: Colors.redAccent,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'red'),
                        ),
                        Icon(
                          Icons.question_answer_rounded,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.red.shade400,
                      onSurface: Colors.greenAccent.shade400,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GlowText(
                            'Click  ',
                            style: TextStyle(
                              fontFamily: 'amita',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent.shade400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreenAccent,
                                onPrimary: Colors.blue,
                                onSurface: Colors.red,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GlowText(
                                  'Custom Tag Search',
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'red'),
                                ),
                              )),
                        )
                      ],
                    ),
                    onPressed: () {}),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onSurface: Colors.yellow,
                    onPrimary: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_down_rounded,
                          color: Colors.deepOrangeAccent.shade700,
                        ),
                        GlowText(
                          ' Back To Home',
                          style: TextStyle(
                            fontFamily: 'red',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onSurface: Colors.yellow,
                    onPrimary: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        GlowText(
                          ' Help ',
                          glowColor: Colors.lightGreenAccent.shade400,
                          style: TextStyle(
                            fontFamily: 'red',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.help_center_rounded,
                          color: Colors.blueAccent.shade700,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //centerTitle: true,

            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.deepPurple.shade900,
                    Colors.black,
                    Colors.red.shade900
                  ],
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft,
                ),
              ),
              child: Column(
                children: [],
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(child: tabheading('Math '),),
                Tab(child: tabheading('Implementation '),),
                Tab(child: tabheading('Binary-Search '),),
                 Tab(child: tabheading('Number Theory '),),

                Tab(child: tabheading('Brute Force '),),
                Tab(child: tabheading('Hashing '),),
                Tab(child: tabheading('Sortings '),),
                Tab(child: tabheading('Strings '),),
                Tab(child: tabheading('DP '),),
                Tab(child: tabheading('Greedy '),),
                Tab(child: tabheading('Graphs '),),
                Tab(child: tabheading('Trees '),),
                Tab(child: tabheading('Constructive Algorithms '),),
                Tab(child: tabheading('BitWise '),),
                Tab(child: tabheading('Dfs and Similar '),),
               
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              Problemfind(tag: 'math'),
              Problemfind(tag: 'implementation'),
              Problemfind(tag: 'binary search'),
              Problemfind(tag: 'number theory'),
              Problemfind(tag: 'brute force'),
              Problemfind(tag: 'hashing'),
              Problemfind(tag: 'sortings'),
              Problemfind(tag: 'strings'),
              Problemfind(tag: 'dp'),
              Problemfind(tag: 'greedy'),
              Problemfind(tag: 'graphs'),
              Problemfind(tag: 'trees'),
              Problemfind(tag: 'constructive algorithms'),

              Problemfind(tag: 'bitmasks'),
              Problemfind(tag: 'dfs and similar'),

              
            ],
          ),
        ),
      );

  

  Container tabheading(String s)
  {
    return Container(
      child: Row(
        children: [
          GlowText(s,glowColor: Colors.black,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'red',
          ),),
          Icon(Icons.question_answer_rounded,color: Colors.white,),
        ],
      ),
    )
    ;
  }



  
}
