import 'package:equatable/equatable.dart';

abstract class VoiceRecordState extends Equatable {
  const VoiceRecordState();

  @override
  List<Object?> get props => [];
}

class VoiceRecordInitialState extends VoiceRecordState {}

class VoiceRecordSuccessState extends VoiceRecordState {
  final bool isStarted;
  final String? path;

  const VoiceRecordSuccessState({required this.isStarted, this.path});

  @override
  List<Object?> get props => [isStarted, path];
}

class PlayVoiceState extends VoiceRecordState {
  final bool playing;
  final String? path;

  const PlayVoiceState({required this.playing, this.path});

  @override
  List<Object?> get props => [playing, path];
}

class VoiceRecordErrorState extends VoiceRecordState {
  final String message;
  const VoiceRecordErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class VoiceTranscriptState extends VoiceRecordState {
  final bool loading;
  final String? transcript;
  final String? translation; 

  const VoiceTranscriptState({required this.loading, this.transcript, this.translation});

  @override
  List<Object?> get props => [loading, transcript, translation];
}
