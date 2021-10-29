import 'package:bloc_demo/logic/cubit/counter/counter_cubit.dart';
import 'package:bloc_demo/logic/cubit/internet/internet_cubit.dart';
import 'package:bloc_demo/logic/utility/app_bloc_observer.dart';
import 'package:bloc_demo/presentation/router/app_router.dart';
import 'package:bloc_demo/presentation/screens/home_screen.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:bloc_demo/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {

  final Connectivity connectivity;
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

/*
Naming conventions:

1. states

Bloc(or cubit) + action + state_of_the_action

ex: WeatherBloc
  WeatherFetchSuccess
  WeatherFetchError
  WeatherFetchInProgress

ex: UserCubit
  UserCreateSuccess
  UserCreateError
  UserDeleteSuccess

2. events

Bloc(or cubit) + subject + action_in_past_tense

ex: UserBloc
  UserFetched
  UserDeleted


3. methods

action on what cubit is working on

ex: UserCubit
  fetch
  delete
  modify
 */