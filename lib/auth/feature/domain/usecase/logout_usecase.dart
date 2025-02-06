import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class LogOutUseCase{
  final UserRepository userRepository;
  LogOutUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call()async{
    return await userRepository.logOut();
  }
}