import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/pages/register/bloc/register_blocs.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBlocs()),
        // BlocProvider(lazy: false, create: (context) => AppBlocs()),
        BlocProvider(create: (create) => SignInBlocs()),
        BlocProvider(create: (create) => RegisterBlocs()),
      ];
}
