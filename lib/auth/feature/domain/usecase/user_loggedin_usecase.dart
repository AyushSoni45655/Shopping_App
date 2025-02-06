import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class UserLoggedInUseCase{
  final UserRepository userRepository;
  UserLoggedInUseCase({required this.userRepository});
  Future<Either<Failuress,bool>>call()async{
    return await userRepository.isUserLoggedIn();
  }
}