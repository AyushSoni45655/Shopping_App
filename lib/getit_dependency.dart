import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_rest_api/auth/feature/data/data_source/product_data_source.dart';
import 'package:e_commarce_rest_api/auth/feature/data/data_source/userDatasource.dart';
import 'package:e_commarce_rest_api/auth/feature/data/repo_implementation/category_repo_implementation.dart';
import 'package:e_commarce_rest_api/auth/feature/data/repo_implementation/user_repo_implementation.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/product_fetch.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/category_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/login_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/logout_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/product_use_case.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/signin_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/user_loggedin_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/fetched/product_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/nav/navigation_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/password/toggle_bloc.dart';
import 'package:e_commarce_rest_api/core/utils/connectivity_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;
Future<void>setupLocator()async{
  // // register http client
  sl.registerLazySingleton<http.Client>(() => http.Client(),);
  //connectivity service
  sl.registerLazySingleton<ConnectivityService>(() =>ConnectivityService() ,);
  // // register datasource
  sl.registerLazySingleton<ProductFetchDataSource>(() => productFetchDataSourceImple(client: sl()),);
  // // register repositry
  sl.registerLazySingleton<FetchProductRepositry>(() =>FetchProductCategoryImple(productFetchDataSource: sl()) ,);
  // // register usecase
  sl.registerLazySingleton<CategoryUseCase>(() => CategoryUseCase(fetchProductRepositry: sl()),);
  sl.registerLazySingleton<ProductUseCase>(()=>ProductUseCase(fetchProductRepositry: sl()));
  // //register Bloc
  sl.registerFactory(() => ProductBloc(categoryUseCase: sl(), connectivityService:sl(),productUseCase: sl()),);
  sl.registerFactory(() => ToggleBloc(),);

                                                                  // for authentication dependencies

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance,);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance,);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() =>sharedPreferences ,);
  sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImplement(sharedPreferences: sl(), firestore:sl(), auth: sl()),);
  sl.registerLazySingleton<UserRepository>(() => UserRepoImplementation(userDataSource: sl()),);
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(userRepository: sl()),);
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(userRepository: sl()),);
  sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(userRepository: sl()),);
  sl.registerLazySingleton<UserLoggedInUseCase>(() => UserLoggedInUseCase(userRepository: sl()),);
  sl.registerFactory(() => NavigationBloc(),);
  sl.registerFactory(() => AuthenticationBloc(logOutUseCase: sl(), loginUseCase: sl(), signInUseCase: sl(), loggedInUseCase: sl()),);

}