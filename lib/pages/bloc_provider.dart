import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/app_block.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (create) => SignInBlocs(),
        ),
      ];
}
