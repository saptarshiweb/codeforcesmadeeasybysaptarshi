import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:flutter_glow/flutter_glow.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map userdata = {};

  List res = [];

  bool isloading = false;

  Future fetchData() async {
    isloading = true;
    http.Response response;

    response = await http.get(
        Uri.parse('https://codeforces.com/api/user.ratedList?activeOnly=true'));

    if (response.statusCode == 200) {
      setState(() {
        isloading = false;
        userdata = json.decode(response.body);

        res = userdata['result'];
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
          child: isloading
              ? CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.lightGreenAccent.shade400,
              )
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    return _print(index);
                  })),
    );
  }

  _print(index) {
    return ListTile(
      title: 
           Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 4, 10, 7),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.7),
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${res[index]['handle']}',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontFamily: "ale",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GlowIcon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent[700],
                            glowColor: Colors.indigoAccent,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.amber[900],
                      height: 50,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.7),
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${res[index]['firstName']}',
                                style: TextStyle(
                                    color: Colors.blueAccent[700],
                                    fontFamily: "ale",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GlowIcon(
                            Icons.person,
                            color: Colors.greenAccent[700],
                            glowColor: Colors.yellowAccent,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.amber[900],
                      height: 50,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Container(
                      height: 50,
                      width: 210,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.7),
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${res[index]['organization']}',
                                style: TextStyle(
                                    color: Colors.redAccent[400],
                                    fontFamily: "ale",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GlowIcon(
                            Icons.school,
                            color: Colors.yellowAccent[700],
                            glowColor: Colors.indigoAccent,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.amber[900],
                      height: 50,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Container(
                      height: 50,
                      width: 210,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple,
                                Colors.black,
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GlowText(
                                '${res[index]['rank']}',
                                glowColor: Colors.yellow,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "ale",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GlowIcon(
                            Icons.star_half_rounded,
                            color: Colors.yellow,
                            glowColor: Colors.white,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.amber[900],
                      height: 50,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white,
                                Colors.blue.withOpacity(0.8),
                              ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GlowText(
                                '${res[index]['maxRating'].toString()}',
                                glowColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "ale",
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GlowIcon(
                            Icons.star_half_rounded,
                            color: Colors.yellow,
                            glowColor: Colors.white,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.amber[900],
                      height: 50,
                      width: 4,
                    ),

                    SizedBox(
                      width: 6,
                    ),

                    // photo

                    // Container(
                    //           height: 50,
                    //           width: 140,
                    //           decoration: BoxDecoration(
                    //               gradient: LinearGradient(
                    //                   begin: Alignment.topLeft,
                    //                   end: Alignment.bottomRight,
                    //                   colors: [
                    //                     Colors.white,
                    //                     Colors.pink.withOpacity(0.2),

                    //                   ]),
                    //               borderRadius: BorderRadius.circular(10)),

                    //         ),

                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        //add border radius here
                        child: Image.network(
                          '${res[index]['avatar']}',
                          height: 60,
                          width: 140,
                        ) //add image location here
                        ),

                    SizedBox(
                      width: 38,
                    ),
                    Container(
                      color: Colors.pink,
                      height: 50,
                      width: 4,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

 

  
}


// printing elements

 