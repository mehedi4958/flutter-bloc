import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_states.dart';

class WelcomeBlocs extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBlocs() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
