import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase{
  final UserRepository userRepository;
  SignInUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call(UserEntity users)async{
    return await userRepository.signIn(users);
  }
}