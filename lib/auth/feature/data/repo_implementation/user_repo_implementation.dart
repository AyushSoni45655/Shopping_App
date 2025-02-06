import 'package:e_commarce_rest_api/auth/feature/data/data_source/userDatasource.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/src/either.dart';

class UserRepoImplementation extends UserRepository{
  final UserDataSource userDataSource;
  UserRepoImplementation({required this.userDataSource});
  @override
  Future<Either<Failuress, bool>> isUserLoggedIn()async{
    try{
      final isloggedin = await userDataSource.isUserLoggedIn();
      return Right(isloggedin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>> logOut() async{
    try{
      final logout = await userDataSource.logout();
      return Right(logout);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> login(String email, String password) async{
    try {
      final login = await userDataSource.login(email, password);
      return Right(login);
    } catch (e) {
      return  Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signIn(UserEntity users)async{
    try{
      final signin = await userDataSource.signup(users);
      return Right(signin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}