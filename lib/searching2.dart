import 'package:codeforces_made_easy/personalised.dart';

import 'package:flutter/material.dart';

import 'package:flutter_glow/flutter_glow.dart';

class Searching2 extends StatefulWidget {
  const Searching2({Key? key}) : super(key: key);

  @override
  _Searching2State createState() => _Searching2State();
}

class _Searching2State extends State<Searching2> {
  final name1 = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Personal(
                  nameholder: name1.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(1)
                  ]),
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1.8, color: Colors.blueAccent.shade400),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: name1,
                    style: TextStyle(
                      color: Colors.purple[900],
                      fontFamily: "cook",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              GlowButton(
                  color: Colors.redAccent.shade400,
                  child: GlowText("Go",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'amita',
                      )),
                  onPressed: () {
                    // getItemAndNavigate(context);
                  })
            ],
          )
        ],
      ),
    );
  }
}
