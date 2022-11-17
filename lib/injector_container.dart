

import 'package:get_it/get_it.dart';
import 'package:sample_firebase_project/data/repository/auth_repository.dart';
import 'package:sample_firebase_project/data/repository/item_repository.dart';
import 'package:sample_firebase_project/data/services/item_service.dart';
import 'package:sample_firebase_project/data/services/local_storage.dart';
import 'package:sample_firebase_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:sample_firebase_project/presentation/item/blocs/item_bloc.dart';

final sl = GetIt.instance;

Future init() async{

  var instance = await LocalStorageService.getInstance();
  sl.registerSingleton<LocalStorageService>(instance);
  // bloc
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(authRepository: sl()));
  sl.registerLazySingleton<ItemBloc>(() => ItemBloc(itemRepository: sl()));

  // repository
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(authService: sl()));
  sl.registerFactory<ItemRepository>(() => ItemRepositoryImpl(itemService: sl()));

  // service
  sl.registerFactory<ItemService>(() =>ItemService() );
  sl.registerFactory<ItemService>(() => ItemService());

}