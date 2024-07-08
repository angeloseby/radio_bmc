import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_bmc/config/color_scheme.dart';
import 'package:radio_bmc/config/text_style_scheme.dart';
import 'package:radio_bmc/utils/radio_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PlayerProvider>(context, listen: false).setUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RadioBMC'),
        backgroundColor: TColorScheme.mainColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: TTextStyle.titleStyle,
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
                  padding: EdgeInsets.all(20.0),
                  color: TColorScheme.mainColor,
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "24x7 Live Stream\n",
                        style: TTextStyle.headlineStyle,
                        children: [
                          TextSpan(
                            text:
                                "\nRadio BMC is yet another breakthrough of Bharata Mata College, which was conceptualised and curated to primarily support and promote the amateur student RJs, and has been a desirable space for emerging student.\n\n\n\n\n\n\n",
                            style: TTextStyle.bodyStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: TColorScheme.subColor,
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
                      color: TColorScheme.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Consumer<PlayerProvider>(
                          builder: (BuildContext context, PlayerProvider player,
                              Widget? child) {
                            return IconButton(
                              onPressed: () {
                                player.playing ? player.pause() : player.play();

                                //implement play
                              },
                              icon: Icon(
                                player.playing
                                    ? Icons.pause_circle_rounded
                                    : Icons.play_arrow_rounded,
                                size: 70,
                                color: TColorScheme.mainColor,
                              ),
                            );
                          },
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
                    style: TTextStyle.copyrightStyle,
                    TextSpan(
                      text: "Copyright © 2024 by ",
                      children: [
                        TextSpan(
                            text: "BMC",
                            style: TTextStyle.copyrightStyle.copyWith(
                              color: TColorScheme.mainColor,
                            )),
                        const TextSpan(text: ". All Rights Reserved."),
                        const TextSpan(text: "\nPowered by "),
                        TextSpan(
                          text: "Department of Computer Science AI & ML",
                          style: TTextStyle.copyrightStyle.copyWith(
                            color: TColorScheme.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
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
