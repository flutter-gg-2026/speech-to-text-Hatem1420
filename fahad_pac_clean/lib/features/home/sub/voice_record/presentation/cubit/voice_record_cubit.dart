import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/use_cases/voice_record_use_case.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/presentation/cubit/voice_record_state.dart';

class VoiceRecordCubit extends Cubit<VoiceRecordState> {
  final VoiceRecordUseCase _voiceRecordUseCase;
  String? _path;

  VoiceRecordCubit(this._voiceRecordUseCase) : super(VoiceRecordInitialState());

  Future<void> startVoiceRecordMethod() async {
    print('cubit start called');
    final result = await _voiceRecordUseCase.startVoiceRecord();
    result.when(
      (success) {
        //here is when success result
        emit(VoiceRecordSuccessState(isStarted: true));
      },
      (whenError) {
        //here is when error result
        emit(VoiceRecordErrorState(message: whenError.message));
      },
    );
  }

  Future<void> stopVoiceRecordMethod() async {
    final path = await _voiceRecordUseCase.stopVoiceRecord();
    path.when(
      (success) async {
        //here is when success result
        _path = success.path;
        emit(VoiceRecordSuccessState(isStarted: false, path: success.path));
        getVoiceText(_path!);
      },
      (whenError) {
        //here is when error result
        emit(VoiceRecordErrorState(message: whenError.message));
      },
    );
  }

  Future<void> playVoiceMethod() async {
    emit(PlayVoiceState(playing: true));
    if (_path == null) return;
    final play = await _voiceRecordUseCase.playVoice(_path!);
    play.when(
      (success) {
        //here is when success result
        emit(PlayVoiceState(playing: false));
      },
      (whenError) {
        //here is when error result
        emit(VoiceRecordErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getVoiceText(String path) async {
    emit(VoiceTranscriptState(loading: true));
    final voiceText = await _voiceRecordUseCase.getVoiceText(_path!);
    voiceText.when(
      (success) {
        emit(
          VoiceTranscriptState(
            loading: false,
            transcript: success.text!,
            translation: success.transcription,
          ),
        );
      },
      (whenError) {
        emit(VoiceRecordErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
