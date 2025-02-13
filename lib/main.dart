import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/app_block.dart';
import 'package:flutter_block/app_event.dart';
import 'package:flutter_block/app_state.dart';
import 'package:flutter_block/pages/sign_in/sign_in.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_block/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
            ),
          ),
          title: 'Flutter Demo',
          routes: {
            'myHomePage': (context) => const MyHomePage(),
            'signIn': (context) => const SignIn(),
          },
          home: Welcome(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
              return Text(
                '${BlocProvider.of<AppBlocs>(context).state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
            return FloatingActionButton(
              heroTag: 'decrement button',
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            );
          }),
          BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
            return FloatingActionButton(
              heroTag: 'increment button',
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }),
        ],
      ),
    );
  }
}
