import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/core/di/dependency_injection.dart';
import 'package:flutter_tast_abdelhamid/core/routing/routes.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/home_screen.dart'; // استيراد الشاشة الجديدة
import 'package:flutter_tast_abdelhamid/task_app.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: routes.HomeScreen, // لنجعلها الشاشة الرئيسية مؤقتاً للتجربة
    routes: [
      GoRoute(
        path: routes.TaskApp,
        builder: (context, state) => const TaskApp(), // هذه الشاشة قد لا تحتاجها الآن
      ),
      GoRoute(
        path: routes.HomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            // الآن الروتر يبني الشاشة الصحيحة التي تحتوي على المنطق
            child: const HomeScreen(),
          );
        },
      ),
    ],
  );
}
