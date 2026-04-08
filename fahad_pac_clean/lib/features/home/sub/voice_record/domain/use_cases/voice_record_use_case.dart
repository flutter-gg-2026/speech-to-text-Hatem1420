import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/entities/voice_record_entity.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/repositories/voice_record_repository_domain.dart';

@lazySingleton
class VoiceRecordUseCase {
  final VoiceRecordRepositoryDomain _repositoryData;

  VoiceRecordUseCase(this._repositoryData);

  Future<Result<bool, Failure>> startVoiceRecord() async {
    return _repositoryData.startVoiceRecord();
  }

  Future<Result<VoiceRecordEntity, Failure>> stopVoiceRecord() async {
    return _repositoryData.stopVoiceRecord();
  }

  Future<Result<bool, Failure>> playVoice(String path) async {
    return _repositoryData.playVoice(path);
  }

  Future<Result<bool, Failure>> stopVoice() async {
    return _repositoryData.stopVoice();
  }

  Future<Result<VoiceRecordEntity, Failure>> getVoiceText(String path) async {
    return _repositoryData.getVoiceText(path);
  }
}
