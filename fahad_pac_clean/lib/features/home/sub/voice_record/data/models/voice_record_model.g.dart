// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceRecordModel _$VoiceRecordModelFromJson(Map<String, dynamic> json) =>
    _VoiceRecordModel(
      path: json['path'] as String,
      text: json['text'] as String?,
      translation: json['translation'] as String?,
    );

Map<String, dynamic> _$VoiceRecordModelToJson(_VoiceRecordModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'text': instance.text,
      'translation': instance.translation,
    };
