import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository{
  Future<Either<Failuress,UserEntity>>signIn(UserEntity users);
  Future<Either<Failuress,UserEntity>>login(String email,String password);
  Future<Either<Failuress,void>>logOut();
  Future<Either<Failuress,bool>>isUserLoggedIn();
  Future<Either<Failuress,void>>forgotPassword(String email);
}