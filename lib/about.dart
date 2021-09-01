import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.deepOrangeAccent.shade100,
                          Colors.yellow,
                          Colors.amberAccent
                        ]),
                        border: Border.all(
                            width: 0.8, color: Colors.orangeAccent.shade400),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GlowText(
                          '  About             ',
                          glowColor: Colors.pinkAccent,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'amita',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 770),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreenAccent,
                      onSurface: Colors.deepPurpleAccent.shade400,
                      onPrimary: Colors.limeAccent.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          GlowText(
                            'Back To Home ',
                            glowColor: Colors.yellowAccent,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'red',
                              fontSize: 28,
                              color: Colors.red,
                            ),
                          ),
                          Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.pinkAccent.shade400,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.purple.shade900,
                            Colors.blueGrey.shade900,
                          ]),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amberAccent,
                          blurRadius: 45,
                          offset: Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.lightGreenAccent.shade400,
                          blurRadius: 45,
                          offset: Offset(0, 10),
                        )
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      AvatarGlow(
                        endRadius: 100,
                        glowColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('profile.jpg'),
                          radius: 65,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      customtext(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.yellowAccent.withOpacity(0.2),
                            Colors.yellow.withOpacity(0.1),
                          ]),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 45,
                          offset: Offset(0, 10),
                          color:
                              Colors.deepOrangeAccent.shade200.withOpacity(0.6),
                        ),
                        BoxShadow(
                          color:
                              Colors.lightGreenAccent.shade200.withOpacity(0.8),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 0.8, color: Colors.orangeAccent.shade100)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreenAccent,
                              onPrimary: Colors.greenAccent.shade700,
                              onSurface: Colors.yellowAccent.shade700),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GlowText(
                                  'Contact Me   ',
                                  glowColor: Colors.white,
                                  style: TextStyle(
                                    color: Colors.redAccent.shade400,
                                    fontFamily: 'red',
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GlowIcon(
                                  Icons.quick_contacts_mail_rounded,
                                  color: Colors.redAccent.shade400,
                                  glowColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 65,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white12),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.9),
                                      ])),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Connect on LinkedIn     ',
                                          style: TextStyle(
                                              color: Colors.blueAccent.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 38,
                                              fontFamily: 'amita'),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'linked1.png',
                                          ),
                                          iconSize: 62,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.orangeAccent.shade100
                                            .withOpacity(0.4),
                                        Colors.white,
                                      ]),
                                      border: Border.all(
                                          width: 0.2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Row(
                                      children: [
                                        GlowButton(
                                          color: Colors.black,
                                          glowColor: Colors.white,
                                          onPressed: () {
                                            _linkedin();
                                          },
                                          child: GlowText('Click  ',
                                              glowColor: Colors.white,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'amita',
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _linkedin();
                                          },
                                          icon: Image.asset('Linked2.png'),
                                          iconSize: 60,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          GlowContainer(
                            height: 100,
                            width: 2,
                            color: Colors.deepOrangeAccent.shade400,
                            glowColor: Colors.lightGreenAccent.shade400,
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white12),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.9),
                                      ])),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 6, 6, 0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          'Connect on GitHub    ',
                                          glowColor: Colors.white,
                                          style: TextStyle(
                                              color: Colors.pinkAccent.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 38,
                                              fontFamily: 'amita'),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _github();
                                          },
                                          color: Colors.black,
                                          icon: Image.asset(
                                            'git2.png',
                                            color: Colors.black,
                                          ),
                                          iconSize: 62,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.purpleAccent.shade100
                                              .withOpacity(0.2),
                                          Colors.yellowAccent.shade100
                                              .withOpacity(0.4),
                                        ]),
                                        border: Border.all(
                                            color: Colors.white38, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            _github();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .deepPurpleAccent.shade700,
                                            onPrimary:
                                                Colors.yellowAccent.shade400,
                                            onSurface: Colors
                                                .lightGreenAccent.shade400,
                                          ),
                                          child: GlowText('Click',
                                              glowColor: Colors.white,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'amita',
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _github();
                                          },
                                          icon: Image.asset('git1.png'),
                                          iconSize: 70,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      //second row--- Codechef Codeforces

                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white12),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.9),
                                      ])),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 6, 6, 0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          '  Connect on Codechef           ',
                                          glowColor: Colors.redAccent.shade700,
                                          style: TextStyle(
                                              color:
                                                  Colors.yellowAccent.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 38,
                                              fontFamily: 'amita'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _codechef();
                                          },
                                          icon: Image.asset('codechef.png'),
                                          iconSize: 150,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _codechef();
                                          },
                                          icon: Icon(Icons.open_in_new_rounded),
                                          color:
                                              Colors.lightGreenAccent.shade700,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          GlowContainer(
                            height: 100,
                            width: 2,
                            color: Colors.redAccent.shade400,
                            glowColor: Colors.indigoAccent.shade700,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white12),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.9),
                                      ])),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 6, 6, 0),
                                    child: Row(
                                      children: [
                                        GlowText(
                                          ' Connect on Codeforces    ',
                                          glowColor: Colors.tealAccent,
                                          style: TextStyle(
                                              color: Colors
                                                  .lightGreenAccent.shade700,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 38,
                                              fontFamily: 'amita'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.purpleAccent.shade100
                                              .withOpacity(0.2),
                                          Colors.yellowAccent.shade100
                                              .withOpacity(0.4),
                                        ]),
                                        border: Border.all(
                                            color: Colors.white38, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _codeforces();
                                          },
                                          icon: Image.asset('codeforces.png'),
                                          iconSize: 60,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            _codeforces();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .deepPurpleAccent.shade700,
                                            onPrimary:
                                                Colors.yellowAccent.shade400,
                                            onSurface: Colors
                                                .lightGreenAccent.shade400,
                                          ),
                                          child: Row(
                                            children: [
                                              GlowText('Click',
                                                  glowColor: Colors.white,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'amita',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              GlowIcon(
                                                Icons.open_in_new_rounded,
                                                color: Colors
                                                    .yellowAccent.shade700,
                                                glowColor: Colors
                                                    .lightGreenAccent.shade200,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          SizedBox(
                            width: 400,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blueAccent.shade700,
                                    Colors.deepOrangeAccent.shade700,
                                    Colors.pinkAccent.shade700,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                    width: 0.1,
                                    color: Colors.orangeAccent.shade400),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 14, 10, 10),
                                      child: Row(
                                        children: [
                                          GlowText(
                                            'Give FeedBack ',
                                            glowColor: Colors.white,
                                            style: TextStyle(
                                              fontFamily: 'red',
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          GlowIcon(
                                            Icons.emoji_emotions,
                                            color: Colors.white,
                                            glowColor: Colors.white,
                                            size: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GlowContainer(
                                            color: Colors.yellow,
                                            glowColor: Colors.yellow,
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.yellowAccent),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GlowText(
                                                'Shoot Me a Mail',
                                                style: TextStyle(
                                                  fontFamily: 'red',
                                                  color: Colors
                                                      .blueAccent.shade400,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                _launchmail();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.black,
                                                onSurface: Colors.red.shade200,
                                                onPrimary: Colors
                                                    .lightGreenAccent.shade200,
                                              ),
                                              child: Row(
                                                children: [
                                                  GlowText(
                                                    'Click Here  ',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 45,
                                                        fontFamily: 'amita'),
                                                  ),
                                                  GlowIcon(
                                                    Icons
                                                        .mark_email_read_rounded,
                                                    color: Colors.white,
                                                    size: 40,
                                                    glowColor:
                                                        Colors.lightGreenAccent,
                                                  ),
                                                ],
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'saptarshimandal125@gmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Widget customtext() {
    return SizedBox(
      width: 900.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 24.0,
          fontFamily: 'amita',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
                'Hello, I am Saptarshi Mandal , a first year undergrad currently studying in Kalyani Government Engineering College, specialising in the field of Information Technology.Having keen interest in learning Algorithms, I am deeply Interested in Competitive Coding.Currently exploring Flutter App and Web Development to the fullest.Hope to learn more and more new Technology !!!'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }

  void _codeforces() async =>
      await canLaunch("https://codeforces.com/profile/saptarshi_10")
          ? await launch("https://codeforces.com/profile/saptarshi_10")
          : throw 'Could not launch ';

  void _codechef() async =>
      await canLaunch("https://www.codechef.com/users/saptarshi_25")
          ? await launch("https://www.codechef.com/users/saptarshi_25")
          : throw 'Could not launch ';

  void _github() async => await canLaunch("https://github.com/saptarshiweb")
      ? await launch("https://github.com/saptarshiweb")
      : throw 'Could not launch ';

  void _linkedin() async => await canLaunch(
          "https://www.linkedin.com/in/saptarshi-mandal-881702209/")
      ? await launch("https://www.linkedin.com/in/saptarshi-mandal-881702209/")
      : throw 'Could not launch ';
}
