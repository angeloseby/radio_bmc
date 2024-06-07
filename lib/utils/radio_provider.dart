import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider extends ChangeNotifier {
  final player = AudioPlayer();

  Future<void> setUrl() async {
    await player.setUrl('http://97.74.94.190:17101/radiobmc.ogg');
    player.play();
    notifyListeners();    
  }

  bool get playing => player.playing;

  void play() {
    player.play();
    setUrl();
    notifyListeners();
  }

  void pause() {
    player.stop();
    notifyListeners();
  }
}
