import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:radio_bmc/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();
  bool playerState = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RadioBMC'),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: titleStyle,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.white,
              child: Image.asset(
                'assets/radiologo.png',
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: mainColor,
                  height: MediaQuery.of(context).size.height * 0.40,
                ),
                Container(
                  color: subColor,
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.40 -
                      ((MediaQuery.of(context).size.width * 0.40 +
                              MediaQuery.of(context).size.height * 0.02) /
                          2),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            if (playerState == false) {
                              await player.play(
                                UrlSource(
                                    'http://97.74.94.190:17101/radiobmc.ogg'),
                              );
                              setState(() {
                                playerState = true;
                              });
                            } else {
                              await player.pause();
                              setState(() {
                                playerState = false;
                              });
                            }
                          },
                          icon: Icon(
                            playerState
                                ? Icons.pause_circle_rounded
                                : Icons.play_arrow_rounded,
                            size: 70,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/bmclogo.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                      style: copyrightStyle,
                      TextSpan(text: "Copyright © 2024 by ", children: [
                        TextSpan(
                            text: "BMC",
                            style: copyrightStyle.copyWith(
                              color: mainColor,
                            )),
                        const TextSpan(text: ". All Rights Reserved."),
                        const TextSpan(text: "\nPowered by "),
                        TextSpan(
                          text: "Department of Computer Science AI & ML",
                          style: copyrightStyle.copyWith(
                            color: mainColor,
                          ),
                        ),
                      ],),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
