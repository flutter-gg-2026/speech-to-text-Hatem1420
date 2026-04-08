import 'package:multiple_result/multiple_result.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/entities/voice_record_entity.dart';

abstract class VoiceRecordRepositoryDomain {
    Future<Result<bool, Failure>> startVoiceRecord();

    Future<Result<VoiceRecordEntity, Failure>> stopVoiceRecord();

    Future<Result<bool, Failure>> playVoice(String path);

    Future<Result<bool, Failure>> stopVoice();

    Future<Result<VoiceRecordEntity, Failure>> getVoiceText(String path);
}
