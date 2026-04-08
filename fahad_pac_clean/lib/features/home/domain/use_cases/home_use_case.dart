import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:fahad_pac_clean/core/errors/failure.dart';
import 'package:fahad_pac_clean/features/home/domain/entities/home_entity.dart';
import 'package:fahad_pac_clean/features/home/domain/repositories/home_repository_domain.dart';


@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);

   Future<Result<HomeEntity, Failure>> getHome() async {
    return _repositoryData.getHome();
  }
}
