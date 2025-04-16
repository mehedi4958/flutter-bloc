import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/pages/application/bloc/application_events.dart';
import 'package:flutter_block/pages/application/bloc/application_sates.dart';

class ApplicationBlocs extends Bloc<ApplicationEvents, ApplicationStates> {
  ApplicationBlocs() : super(const ApplicationStates()) {
    on<TriggerApplicationEvent>((event, emit) {
      emit(ApplicationStates(index: event.index));
    });
  }
}
