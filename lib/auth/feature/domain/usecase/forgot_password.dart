import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/user_repositry.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class ForgotPasswordUseCase{
  final UserRepository userRepository;
  ForgotPasswordUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call(String email)async{
    return await userRepository.forgotPassword(email);
  }
}