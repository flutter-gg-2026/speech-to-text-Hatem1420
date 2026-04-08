import 'package:multiple_result/multiple_result.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
    Future<Result<HomeEntity, Failure>> getHome();
}
