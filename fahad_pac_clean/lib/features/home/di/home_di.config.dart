// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fahad_pac_clean/core/services/local_keys_service.dart' as _i706;
import 'package:fahad_pac_clean/core/services/record_service.dart' as _i678;
import 'package:fahad_pac_clean/core/services/transcription_service.dart'
    as _i334;
import 'package:fahad_pac_clean/features/home/data/datasources/home_remote_data_source.dart'
    as _i825;
import 'package:fahad_pac_clean/features/home/data/repositories/home_repository_data.dart'
    as _i969;
import 'package:fahad_pac_clean/features/home/domain/repositories/home_repository_domain.dart'
    as _i339;
import 'package:fahad_pac_clean/features/home/domain/use_cases/home_use_case.dart'
    as _i355;
import 'package:fahad_pac_clean/features/home/sub/voice_record/data/datasources/voice_record_remote_data_source.dart'
    as _i711;
import 'package:fahad_pac_clean/features/home/sub/voice_record/data/repositories/voice_record_repository_data.dart'
    as _i1022;
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/repositories/voice_record_repository_domain.dart'
    as _i662;
import 'package:fahad_pac_clean/features/home/sub/voice_record/domain/use_cases/voice_record_use_case.dart'
    as _i302;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i825.BaseHomeRemoteDataSource>(
      () => _i825.HomeRemoteDataSource(
        gh<_i706.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i711.BaseVoiceRecordRemoteDataSource>(
      () => _i711.VoiceRecordRemoteDataSource(
        gh<_i678.RecordService>(),
        gh<_i334.TranscriptionService>(),
      ),
    );
    gh.lazySingleton<_i339.HomeRepositoryDomain>(
      () => _i969.HomeRepositoryData(gh<_i825.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i355.HomeUseCase>(
      () => _i355.HomeUseCase(gh<_i339.HomeRepositoryDomain>()),
    );
    gh.lazySingleton<_i662.VoiceRecordRepositoryDomain>(
      () => _i1022.VoiceRecordRepositoryData(
        gh<_i711.BaseVoiceRecordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i302.VoiceRecordUseCase>(
      () => _i302.VoiceRecordUseCase(gh<_i662.VoiceRecordRepositoryDomain>()),
    );
    return this;
  }
}
