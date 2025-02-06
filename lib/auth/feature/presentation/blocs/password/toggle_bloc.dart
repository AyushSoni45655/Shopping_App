import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, TogglePassowrdSTtae> {
  ToggleBloc() : super(TogglePassowrdSTtae(isObscure: true)) {
    on<PassowrdToggleEvent>((event, emit) {
      emit(TogglePassowrdSTtae(isObscure: !state.isObscure));
    });
  }
}
