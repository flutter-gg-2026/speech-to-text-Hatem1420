import 'package:equatable/equatable.dart';

class VoiceRecordEntity extends Equatable {
  final String path;
  final String? text;
  final String? transcription;

  const VoiceRecordEntity({required this.path, this.text, this.transcription});

  @override
  List<Object?> get props => [path, text, transcription];
}
