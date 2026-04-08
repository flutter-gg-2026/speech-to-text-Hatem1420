import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fahad_pac_clean/core/services/local_keys_service.dart';
import 'package:fahad_pac_clean/features/home/data/models/home_model.dart';
import 'package:fahad_pac_clean/core/errors/network_exceptions.dart';


abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();
}


@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   HomeRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<HomeModel> getHome() async {
    try {
      return HomeModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
