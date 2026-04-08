import 'package:fahad_pac_clean/core/extensions/font_extensions.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/presentation/cubit/voice_record_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/presentation/cubit/voice_record_cubit.dart';

class VoiceRecordFeatureWidget extends StatelessWidget {
  const VoiceRecordFeatureWidget({super.key, required this.callBack});
  final Function(String) callBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceRecordCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final recordCubit = context.read<VoiceRecordCubit>();
          return BlocBuilder<VoiceRecordCubit, VoiceRecordState>(
            builder: (context, state) {
              if (state is VoiceRecordSuccessState && state.path != null) {
                callBack(state.path!);
              }
              return Column(
                spacing: 10,
                children: [
                  if (state is VoiceTranscriptState)
                    state.loading
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            spacing: 10,
                            children: [
                              Text('Transcription:\n ${state.transcript}'),
                              if (state.translation != null)
                                Text('Translation:\n ${state.translation}'),
                            ],
                          ),

                  Row(
                    mainAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      GestureDetector(
                        onLongPress: () => recordCubit.startVoiceRecordMethod(),
                        onLongPressUp: () =>
                            recordCubit.stopVoiceRecordMethod(),
                        child: Container(
                          width: 6.sizeSH(),
                          height: 6.sizeSH(),
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: state is VoiceRecordSuccessState
                                ? state.isStarted
                                      ? Colors.green
                                      : Colors.grey
                                : Colors.grey,
                          ),
                          child: Center(child: Icon(Icons.mic)),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => recordCubit.playVoiceMethod(),
                        child: Container(
                          width: 6.sizeSH(),
                          height: 6.sizeSH(),
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: state is PlayVoiceState
                                ? state.playing
                                      ? Colors.green
                                      : Colors.grey
                                : Colors.grey,
                          ),
                          child: Center(
                            child: Icon(
                              state is PlayVoiceState
                                  ? state.playing
                                        ? Icons.stop
                                        : Icons.play_arrow
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
