import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class Problemfind extends StatefulWidget {
  final tag;
  // const Problemfind({ Key? key }) : super(key: key);

  Problemfind({required this.tag});

  @override
  _ProblemfindState createState() => _ProblemfindState(tag);
}

class _ProblemfindState extends State<Problemfind> {
  String tag;

  _ProblemfindState(this.tag);

  Map all = {};
  List allprob = [];
  bool isprob = false;

  Future probdata() async {
    http.Response response;
    isprob = true;

    response = await http.get(
        Uri.parse('https://codeforces.com/api/problemset.problems?tags=$tag;'));

    if (response.statusCode == 200) {
      setState(() {
        isprob = false;
        all = json.decode(response.body);

        allprob = all['result']['problems'];
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.yellowAccent.withOpacity(0.6),
              Colors.limeAccent,
              Colors.lightGreenAccent,
              Colors.greenAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            border: Border.all(
              color: Colors.pinkAccent.shade400,
              width: 0.6,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: isprob?Center(child: CircularProgressIndicator(
            color: Colors.redAccent.shade400,
            backgroundColor: Colors.yellow.shade200,

            
          )): SizedBox(
            height: 500,
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allprob.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.white,
                            Colors.tealAccent.shade100,
                          ]),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            GlowText(
                              '${allprob[index]['name']}          ',
                              glowColor: Colors.deepOrangeAccent,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'amita',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),

                            //rating
                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GlowText(
                                    'Rating : ${allprob[index]['rating'].toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'amita',
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.yellowAccent.withOpacity(0.5),
                                      Colors.orangeAccent.shade100
                                          .withOpacity(0.5),
                                    ]),
                                    border: Border.all(
                                      color: Colors.indigoAccent.shade700,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(3))),

                            SizedBox(
                              width: 20,
                            ),

                            //points

                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GlowText(
                                    'Points : ${allprob[index]['points'].toString()}',
                                    glowColor: Colors.white,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'amita',
                                        color: Colors.redAccent.shade400),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.tealAccent.withOpacity(0.5),
                                      Colors.purpleAccent.shade100
                                          .withOpacity(0.5),
                                    ]),
                                    border: Border.all(
                                      color: Colors.indigoAccent.shade700,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(3))),

                            SizedBox(
                              width: 20,
                            ),

                            //problemNo.

                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GlowText(
                                    'Problem : ${allprob[index]['index']}',
                                    glowColor: Colors.yellowAccent,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'amita',
                                      color: Colors.deepPurple.shade900,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.greenAccent.withOpacity(0.5),
                                      Colors.lightGreenAccent.shade100
                                          .withOpacity(0.5),
                                    ]),
                                    border: Border.all(
                                      color: Colors.indigoAccent.shade700,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(3))),

                            //LinkToContainer

                            SizedBox(
                              width: 20,
                            ),

                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      GlowText(
                                        'Question',
                                        glowColor: Colors.white,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'amita',
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {

                                          _problemlaunch('${allprob[index]['index']}', '${allprob[index]['contestId']}'.toString());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.redAccent,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Link',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'om',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.open_in_full_rounded,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.orangeAccent.withOpacity(0.8),
                                      Colors.redAccent.withOpacity(0.4),
                                      Colors.pinkAccent.withOpacity(0.5),
                                    ]),
                                    border: Border.all(
                                      color: Colors.indigoAccent.shade700,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(3)))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }


  void _problemlaunch(String p,String id) async =>
      await canLaunch("https://codeforces.com/problemset/problem/$id/$p")
          ? await launch("https://codeforces.com/problemset/problem/$id/$p")
          : throw 'Could not launch ';
}
