import 'dart:io';

import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';

@lazySingleton
class RecordService {
  final _recorder = AudioRecorder();
  final _player = AudioPlayer();

  void requestPermission() async {
    final hasPermission = await _recorder.hasPermission(request: true);
    if (!hasPermission) {
      throw PermissionFailure("record not allow");
    }
  }

  Future<void> startRecording() async {
    
    requestPermission();
    final Directory appDocumentsDir = await getTemporaryDirectory();

    await _recorder.start(
      const RecordConfig(),
      path: '${appDocumentsDir.path}/myFile.m4a',
    );
  }

  Future<String?> stopRecording() async {
    final path = await _recorder.stop();
    print(path ?? 'nothing');
    // Stop recording...
    return path;
  }

  Future<void> playAudio(String path) async {
    await _player.setFilePath(path);
    await _player.play();
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }
}
