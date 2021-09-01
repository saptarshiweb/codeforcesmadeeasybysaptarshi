import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class Personal extends StatefulWidget {
  // const Personal({ Key? key }) : super(key: key);
  final nameholder;

  Personal({required this.nameholder});

  @override
  _PersonalState createState() => _PersonalState(nameholder);
}

class _PersonalState extends State<Personal> {
  String nameholder;

  _PersonalState(this.nameholder);

  Map perdata = {};

  List result = [];

  Map submitdata = {};

  List submitresult = [];

  bool isloading = false;

  bool issubmit = false;

  Future fetchpersonData() async {
    isloading = true;
    http.Response response;

    response = await http.get(
        Uri.parse('https://codeforces.com/api/user.info?handles=$nameholder;'));

    if (response.statusCode == 200) {
      setState(() {
        isloading = false;
        perdata = json.decode(response.body);

        result = perdata['result'];
      });
    }
  }

  Future submit() async {
    issubmit = true;

    http.Response response;

    response = await http.get(Uri.parse(
        'https://codeforces.com/api/user.status?handle=$nameholder&from=1&count=100'));

    if (response.statusCode == 200) {
      setState(() {
        issubmit = false;

        submitdata = json.decode(response.body);

        submitresult = submitdata['result'];
      });
    }
  }

  @override
  void initState() {
    fetchpersonData();
    submit();
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white70.withOpacity(0.7),
                            Colors.amberAccent.withOpacity(0.02),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightGreenAccent.shade400,
                            blurRadius: 2,
                            offset: Offset(1.0, 2.0),
                          ),
                        ],
                        border:
                            Border.all(color: Colors.orangeAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GlowText(
                          "Personalised Data",
                          glowColor: Colors.orangeAccent,
                          style: TextStyle(
                            color: Colors.deepPurple[900],
                            fontFamily: 'ale',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 800,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                        onPrimary: Colors.transparent,
                        onSurface: Colors.pink.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            GlowText(
                              "Back",
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'om',
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                              color: Colors.orangeAccent.shade700,
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),

              // Row(children: [
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Center(
              //       child: Container(
              //         height: 30,width: 300,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(image:
              //           AssetImage("personalisedbg.jpg"),
              //           ),
              //         ),

              //       ),
              //     ),
              //   )

              // ],),
              SizedBox(
                height: 1,
              ),
              print(),
            ],
          ),
        ),
      ),
    );
  }

  Widget submissions() {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Center(
          child: issubmit
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: submitresult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent.shade100,
                              onPrimary: Colors.blue,
                              onSurface: Colors.tealAccent.shade400,
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: GlowText(
                                    "${submitresult[index]['problem']['name']}   ",
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: 'om',
                                        color: Colors.black),
                                  ),
                                ),
                                GlowText(
                                  "${submitresult[index]['programmingLanguage']}   ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'om',
                                      color: Colors.blueAccent.shade700),
                                ),
                                GlowText(
                                  "${submitresult[index]['verdict']}   ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'om',
                                      color: submitcolor(
                                          "${submitresult[index]['verdict']}")),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 2, 2, 2),
                                  child: Container(
                                    child: anotherwebsite(
                                        "${submitresult[index]['contestId'].toString()}",
                                        "${submitresult[index]['id']}"
                                            .toString()),
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  Color submitcolor(String str) {
    if (str == "WRONG_ANSWER")
      return Colors.pinkAccent.shade400;
    else if (str == "OK")
      return Colors.lightGreenAccent.shade700;
    else
      return Colors.yellowAccent;
  }

  Widget anotherwebsite(String user, String id) {
    return ElevatedButton(
        onPressed: () {
          _launchURL(user, id);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          onPrimary: Colors.orangeAccent.shade400,
          onSurface: Colors.yellowAccent.shade700,
        ),
        child: GlowText(
          "Link",
          style: TextStyle(
              color: Colors.purpleAccent,
              fontFamily: 'red',
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ));
  }

  void _launchURL(String user, String id) async =>
      await canLaunch("https://codeforces.com/contest/$user/submission/$id")
          ? await launch("https://codeforces.com/contest/$user/submission/$id")
          : throw 'Could not launch ';

  Widget print() {
    return SizedBox(
      height: 1600,
      child: SingleChildScrollView(
        child: Center(
          child: isloading
              ? CircularProgressIndicator()
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orangeAccent.shade100,
                                Colors.white70,
                              ],
                            ),
                            border: Border.all(
                                width: 0.5, color: Colors.pink.shade50),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              // BoxShadow(
                              //   color: Colors.tealAccent,
                              //   blurRadius: 6,
                              //   offset: Offset(
                              //     3.0,
                              //     4.0,
                              //   ),
                              // )
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 550,
                                    height: 610,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.tealAccent.shade400,
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(22),
                                        gradient: LinearGradient(colors: [
                                          Colors.tealAccent.shade400,
                                          Colors.tealAccent.shade400
                                              .withOpacity(0.4),
                                        ])),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            "${result[index]["titlePhoto"]}",
                                            height: 230,
                                            width: 230,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                  Icons
                                                      .supervised_user_circle_sharp,
                                                  color:
                                                      Colors.deepPurpleAccent),
                                              GlowText(
                                                "${result[index]["firstName"]} ${result[index]["lastName"]}",
                                                glowColor: Colors.white,
                                                style: TextStyle(
                                                  color: Colors.purple.shade900,
                                                  fontFamily: 'amita',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.school_sharp,
                                                  color: Colors.yellowAccent),
                                              Flexible(
                                                child: GlowText(
                                                  "${result[index]["organization"]} ",
                                                  glowColor:
                                                      Colors.orangeAccent[400],
                                                  style: TextStyle(
                                                    color: Colors
                                                        .indigoAccent[700],
                                                    fontFamily: 'amita',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_city_sharp,
                                                  color: Colors.black),
                                              GlowText(
                                                "${result[index]["city"]}, ${result[index]["country"]}",
                                                glowColor:
                                                    Colors.tealAccent[400],
                                                style: TextStyle(
                                                  color:
                                                      Colors.yellowAccent[700],
                                                  fontFamily: 'amita',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 36,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_search_rounded,
                                                color: Colors.deepOrange,
                                              ),
                                              GlowText(
                                                "UserName --> ${result[index]["handle"]}",
                                                glowColor: Colors.white,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontFamily: 'amita',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.score_sharp,
                                                color: Colors.black,
                                              ),
                                              GlowText(
                                                "Rating :  ${result[index]["rating"]}",
                                                glowColor: Colors.black,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'amita',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: Colors
                                                    .deepPurpleAccent.shade700,
                                              ),
                                              GlowText(
                                                "Rank :  ${result[index]["maxRank"]}",
                                                glowColor: choosecolor(
                                                    "${result[index]["maxRank"]}"),
                                                style: TextStyle(
                                                  color: choosecolor(
                                                      "${result[index]["maxRank"]}"),
                                                  fontFamily: 'amita',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 610,
                                    width: 650,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.lightGreenAccent.shade100,
                                        Colors.lightGreenAccent.shade100
                                            .withOpacity(0.6),
                                      ]),
                                      border: Border.all(
                                          color:
                                              Colors.lightGreenAccent.shade200,
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 10, 8, 2),
                                          child: Container(
                                            height: 530,
                                            width: 620,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.deepPurpleAccent
                                                        .shade400,
                                                    Colors.deepPurpleAccent,
                                                    Colors.deepPurpleAccent
                                                        .shade100
                                                        .withOpacity(0.6),
                                                    Colors.white,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.deepPurpleAccent
                                                      .shade100),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 280, 5),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.white,
                                                        onPrimary: Colors
                                                            .lightGreenAccent
                                                            .shade400,
                                                        onSurface:
                                                            Colors.cyanAccent,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                4, 4, 4, 4),
                                                        child: Row(
                                                          children: [
                                                            GlowText(
                                                              "Recent Submissions             ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple
                                                                    .shade900,
                                                                fontFamily:
                                                                    'red',
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              glowColor: Colors
                                                                  .redAccent
                                                                  .shade400,
                                                            ),
                                                            GlowIcon(
                                                              Icons.code_sharp,
                                                              color: Colors
                                                                      .deepPurpleAccent[
                                                                  700],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      onPressed: () {}),
                                                ),
                                                Container(
                                                  child: submissions(),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  Color choosecolor(String str) {
    if (str == "legendary grandmaster" ||
        str == "international grandmaster" ||
        str == "grandmaster")
      return Colors.red;
    else if (str == "international master" || str == "master")
      return Colors.yellowAccent.shade700;
    else if (str == "candidate master")
      return Colors.deepPurple.shade800;
    else if (str == "expert")
      return Colors.blueAccent.shade700;
    else if (str == "specialist")
      return Colors.indigoAccent;
    else if (str == "pupil")
      return Colors.greenAccent.shade700;
    else
      return Colors.black87;
  }
}
