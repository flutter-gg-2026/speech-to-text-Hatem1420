import 'package:fahad_pac_clean/features/home/presentation/cubit/home_state.dart';
import 'package:fahad_pac_clean/features/home/sub/voice_record/presentation/pages/voice_record_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fahad_pac_clean/features/home/presentation/cubit/home_cubit.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Padding(
        padding: .all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccessState && state.path != null) {
                    return Expanded(child: Text(state.path!));
                  }
                  return SizedBox.shrink();
                },
              ),
              Expanded(
                child: VoiceRecordFeatureWidget(
                  callBack: (path) => homeCubit.getVoicePath(path),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
