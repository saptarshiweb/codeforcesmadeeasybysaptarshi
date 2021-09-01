import 'package:codeforces_made_easy/personalised.dart';

import 'package:flutter/material.dart';

import 'package:flutter_glow/flutter_glow.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
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
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name1,
                    style: TextStyle(
                      color: Colors.purple[900],
                      fontFamily: "om",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'UserName',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              GlowButton(
                  color: Colors.redAccent.shade400,
                  child: GlowText("Go",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'amita',
                      )),
                  onPressed: () {
                    getItemAndNavigate(context);
                  })
            ],
          )
        ],
      ),
    );
  }
}
