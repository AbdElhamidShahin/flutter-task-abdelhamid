import 'package:flutter/material.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/logic/packages_cubit.dart';

import '../../features/filter_screen/ui/filter_screen.dart';
import '../../home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/core/di/dependency_injection.dart';
import 'package:flutter_tast_abdelhamid/core/routing/routes.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart'; // <--- Cubit الخاص بالـ Home
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: routes.AppLayout,
    routes: [
      GoRoute(
        path: routes.AppLayout,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => NavigationCubit()),
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(create: (context) => getIt<PackagesCubit>()),
            ],
            child: AppLayout(),
          );
        },
      ),

      GoRoute(
        path: routes.FilterScreen,
        builder: (BuildContext context, GoRouterState state) {
          return FilterScreen();
        },
      ),
    ],
  );
}
