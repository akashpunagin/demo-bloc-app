import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString(), name: "Observer");
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("CREATE: $bloc", name: "Observer");
    super.onCreate(bloc);
  }


}