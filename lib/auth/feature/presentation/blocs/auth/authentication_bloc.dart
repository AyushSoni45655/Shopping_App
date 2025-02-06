import 'package:bloc/bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/login_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/logout_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/signin_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/user_loggedin_usecase.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserLoggedInUseCase loggedInUseCase;
  final SignInUseCase signInUseCase;
  final LoginUseCase loginUseCase;
  final LogOutUseCase logOutUseCase;
  AuthenticationBloc({required this.logOutUseCase,required this.loginUseCase,required this.signInUseCase,required this.loggedInUseCase}) : super(AuthenticationInitial()) {
    on<SigninEvent>((event, emit)async{
      emit(AuthLoading());
      final signin =   await signInUseCase(event.userEntity);
      signin.fold((l) => emit(AuthFailure(l.error.toString())), (r) => emit(AuthSuccess(r)),);
    });
    on<loginEvent>((event, emit)async{
      emit(AuthLoading());
      final login =   await loginUseCase(event.email,event.password);
      login.fold((l) => emit(AuthFailure(l.error.toString())), (r) => emit(AuthSuccess(r)),);
    });
    on<logoutEvent>((event, emit)async{
      emit(AuthLoading());
      final logout =   await logOutUseCase();
      logout.fold((l) => emit(AuthFailure(l.error.toString())), (_) => emit(AuthLoggedOut()),);
    });
    on<isLoggedInEvent>((event, emit)async{
      emit(AuthLoading());
      final isloggedIn =   await loggedInUseCase();
      isloggedIn.fold((l) => emit(AuthLoggedOut()), (r) => r?emit(AuthLoggedIn()):emit(AuthLoggedOut()),);
    });
  }
}
