// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fahad_pac_clean/core/services/local_keys_service.dart' as _i706;
import 'package:fahad_pac_clean/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i98;
import 'package:fahad_pac_clean/features/auth/data/repositories/auth_repository_data.dart'
    as _i21;
import 'package:fahad_pac_clean/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i415;
import 'package:fahad_pac_clean/features/auth/domain/use_cases/auth_use_case.dart'
    as _i383;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i98.BaseAuthRemoteDataSource>(
      () => _i98.AuthRemoteDataSource(
        gh<_i706.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i415.AuthRepositoryDomain>(
      () => _i21.AuthRepositoryData(gh<_i98.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i383.AuthUseCase>(
      () => _i383.AuthUseCase(gh<_i415.AuthRepositoryDomain>()),
    );
    return this;
  }
}
