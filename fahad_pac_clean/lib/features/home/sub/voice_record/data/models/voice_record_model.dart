import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/entities/voice_record_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'voice_record_model.freezed.dart';
part 'voice_record_model.g.dart';

@freezed
abstract class VoiceRecordModel with _$VoiceRecordModel {
  const factory VoiceRecordModel({
    required String path,
     String? text,
     String? translation
    
  }) = _VoiceRecordModel;

  factory VoiceRecordModel.fromJson(Map<String, Object?> json) => _$VoiceRecordModelFromJson(json);
}



extension VoiceRecordModelMapper on VoiceRecordModel {
  VoiceRecordEntity toEntity() {
    return VoiceRecordEntity(path: path, text: text, transcription: translation);
  }
  }
