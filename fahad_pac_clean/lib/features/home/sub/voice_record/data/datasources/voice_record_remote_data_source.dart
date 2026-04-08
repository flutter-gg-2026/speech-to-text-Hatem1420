
import 'package:fahad_pac_clean/core/services/record_service.dart';
import 'package:fahad_pac_clean/core/services/transcription_service.dart';
import 'package:injectable/injectable.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/data/models/voice_record_model.dart';
import 'package:fahad_pac_clean/core/errors/network_exceptions.dart';

abstract class BaseVoiceRecordRemoteDataSource {
  Future<void> startVoiceRecord();

  Future<VoiceRecordModel> stopVoiceRecord();

  Future<void> playVoice(String path);

  Future<void> stopVoice();

  Future<VoiceRecordModel> getVoiceText(String path);
}

@LazySingleton(as: BaseVoiceRecordRemoteDataSource)
class VoiceRecordRemoteDataSource implements BaseVoiceRecordRemoteDataSource {
  final RecordService _recordService;
  final TranscriptionService _transcriptionService;

  VoiceRecordRemoteDataSource(this._recordService, this._transcriptionService);

  @override
  Future<void> startVoiceRecord() async {
    try {
      await _recordService.startRecording();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<VoiceRecordModel> stopVoiceRecord() async {
    try {
      final path = await _recordService.stopRecording();
      print('recording stopped , path: $path');
      return VoiceRecordModel(path: path!);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> playVoice(String path) async {
    try {
      await _recordService.playAudio(path);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> stopVoice() async {
    try {
      await _recordService.stopAudio();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<VoiceRecordModel> getVoiceText(String path) async {
    try {
      final text = await _transcriptionService.getVoiceToText(path);
      return VoiceRecordModel(path: path, text: text['arabic'], translation: text['english']);
    } catch (error) {
      print("ERROR: $error");
      throw FailureExceptions.getException(error);
    }
  }
}
