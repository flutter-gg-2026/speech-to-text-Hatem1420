import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fahad_pac_clean/core/errors/network_exceptions.dart';
import 'package:fahad_pac_clean/core/network/api_endpoints.dart';
import 'package:fahad_pac_clean/core/network/dio_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TranscriptionService {
  final DioClient _dio;

  TranscriptionService(this._dio) {
    _dio.dio.options.baseUrl = ApiEndpoints.transcriptBaseUrl;
    _dio.dio.options.headers = {
      "Content-Type": "multipart/form-data",
      "x-gladia-key": ApiEndpoints.transcriptBaseUrlKey,
    };
  }

  Future<Map<String, dynamic>> getVoiceToText(String path) async {
    try {
      final FormData formData = FormData.fromMap({
        "audio": await MultipartFile.fromFile(path, filename: "recording.m4a"),
      });

      final audioUrl = await uploadFile(formData);
      final resultUrl = await createJob(audioUrl['audio_url']);
      final result = await getTranscript(resultUrl['id']);

      final String transcript =
          result["result"]["transcription"]["full_transcript"];
      final translation =
          result["result"]["translation"]["results"][0]["full_transcript"];

      return {'arabic': transcript, 'english': translation};
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  Future<Map<String, dynamic>> uploadFile(FormData formData) async {
    final uploadResponse = await _dio.post(
      ApiEndpoints.transcriptLoad,
      data: formData,
    );

    if (uploadResponse.statusCode != 200) {
      throw Exception(uploadResponse.statusMessage);
    }

    log("Uploading complete!");

    return uploadResponse.data;
  }

  Future<Map<String, dynamic>> createJob(String audioUrl) async {
    final jobResponse = await _dio.post(
      ApiEndpoints.transcriptJobCreate,
      data: {
        "audio_url": audioUrl,
        "language_config": {
          "languages": ["ar"],
          "code_switching": false,
        },
        "diarization": true,
        "diarization_config": {
          "number_of_speakers": 3,
          "min_speakers": 1,
          "max_speakers": 5,
        },
        "translation": true,
        "translation_config": {
          "model": "base",
          "target_languages": ["en"],
          "context_adaptation": true,
          "context": "Business meeting discussing quarterly results",
          "informal": false,
        },
        "subtitles": true,
        "subtitles_config": {
          "formats": ["srt", "vtt"],
        },
      },
      options: Options(
        headers: {
          "x-gladia-key": ApiEndpoints.transcriptBaseUrlKey,
          "Content-Type": "application/json",
        },
      ),
    );

    if (jobResponse.statusCode != 201) {
      throw Exception(jobResponse.statusMessage);
    }

    log("Transcription is loading!...");

    return jobResponse.data;
  }

  Future<Map<String, dynamic>> getTranscript(String transId) async {
    bool isDone = false;
    Response<dynamic> resultResponse;

    do {
      resultResponse = await _dio.get(
        ApiEndpoints.transcriptResultEndpoint(transId),
      );

      if (resultResponse.data['status'] == 'done') {
        isDone = true;
        log("Process complete!");
      } else if (resultResponse.data['status'] == 'error') {
        throw Exception(resultResponse.statusMessage);
      } else {
        await Future.delayed(Duration(seconds: 3));
      }
    } while (!isDone);

    return resultResponse.data;
  }
}
