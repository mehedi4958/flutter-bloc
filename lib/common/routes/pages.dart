import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/routes/names.dart';
import 'package:flutter_block/pages/application/application_page.dart';
import 'package:flutter_block/pages/register/bloc/register_blocs.dart';
import 'package:flutter_block/pages/register/register.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_block/pages/sign_in/sign_in.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_block/pages/welcome/welcome.dart';

/// unify bloc provider, pages, and, routes
class AppRoutes {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRouteURLS.initial,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBlocs()),
      ),
      PageEntity(
        route: AppRouteURLS.signIn,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBlocs()),
      ),
      PageEntity(
        route: AppRouteURLS.register,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBlocs()),
      ),
      PageEntity(
        route: AppRouteURLS.application,
        page: const ApplicationPage(),
        // bloc: BlocProvider(create: (_) => WelcomeBlocs()),
      ),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      // check for route name matching when navigator gets triggered
      var result = routes().where(
        (element) => element.route == routeSettings.name,
      );
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: routeSettings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: routeSettings);
  }
}

class PageEntity {
  PageEntity({required this.route, required this.page, this.bloc});
  String route;
  Widget page;
  dynamic bloc;
}
