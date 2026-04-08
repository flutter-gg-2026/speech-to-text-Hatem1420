import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:fahad_pac_clean/core/errors/network_exceptions.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/entities/voice_record_entity.dart';

import 'package:fahad_pac_clean/features/home/sub/voice_record/data/datasources/voice_record_remote_data_source.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/data/models/voice_record_model.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/repositories/voice_record_repository_domain.dart';

@LazySingleton(as: VoiceRecordRepositoryDomain)
class VoiceRecordRepositoryData implements VoiceRecordRepositoryDomain {
  final BaseVoiceRecordRemoteDataSource remoteDataSource;

  VoiceRecordRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> startVoiceRecord() async {
    try {
      await remoteDataSource.startVoiceRecord();
      return Success(true);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<VoiceRecordEntity, Failure>> stopVoiceRecord() async {
    try {
      final voiceModel = await remoteDataSource.stopVoiceRecord();
      //remoteDataSource.playVoice(voiceModel.path);
      return Success(voiceModel.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> playVoice(String path) async {
    try {
      await remoteDataSource.playVoice(path);
      return Success(true);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> stopVoice() async {
    try {
      await remoteDataSource.stopVoice();
      return Success(true);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<VoiceRecordEntity, Failure>> getVoiceText(String path) async {
    try {
      print('get text will call');
      final voiceModel = await remoteDataSource.getVoiceText(path);
      return Success(voiceModel.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
