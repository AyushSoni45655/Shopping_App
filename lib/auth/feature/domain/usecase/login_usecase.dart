import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase{
  final UserRepository userRepository;
  LoginUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call(String email,String password)async{
    return await userRepository.login(email, password);
  }
}