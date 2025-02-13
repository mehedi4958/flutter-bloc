import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_events.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_states.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInStates> {
  SignInBlocs() : super(SignInStates()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    print('Email: ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    print('Password: ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
