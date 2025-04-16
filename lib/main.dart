import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/values/colors.dart';
import 'package:flutter_block/global.dart';
import 'package:flutter_block/pages/bloc_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              elevation: 0,
              color: Colors.white,
            ),
          ),
          title: 'Flutter Demo',
          onGenerateRoute: AppRoutes.generateRouteSettings,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('Flutter Demo Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocBuilder<ApplicationBlocs, ApplicationStates>(
//                 builder: (context, state) {
//               return Text(
//                 '${BlocProvider.of<ApplicationBlocs>(context).state.counter}',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               );
//             }),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           BlocBuilder<ApplicationBlocs, ApplicationStates>(
//               builder: (context, state) {
//             return FloatingActionButton(
//               heroTag: 'decrement button',
//               onPressed: () =>
//                   BlocProvider.of<ApplicationBlocs>(context).add(Decrement()),
//               tooltip: 'Decrement',
//               child: const Icon(Icons.remove),
//             );
//           }),
//           BlocBuilder<ApplicationBlocs, ApplicationStates>(
//               builder: (context, state) {
//             return FloatingActionButton(
//               heroTag: 'increment button',
//               onPressed: () =>
//                   BlocProvider.of<ApplicationBlocs>(context).add(Increment()),
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
