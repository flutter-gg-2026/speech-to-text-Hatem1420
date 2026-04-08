import 'package:multiple_result/multiple_result.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepositoryDomain {
    Future<Result<AuthEntity, Failure>> getAuth();
}
