import 'package:get_it/get_it.dart';
import 'package:fahad_pac_clean/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:fahad_pac_clean/features/auth/di/auth_di.dart';
import 'package:fahad_pac_clean/features/home/di/home_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core']
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureAuth(getIt);
    configureHome(getIt);
}
