import 'package:flutter/material.dart';

import '../../home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/core/di/dependency_injection.dart';
import 'package:flutter_tast_abdelhamid/core/routing/routes.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart'; // <--- Cubit الخاص بالـ Home
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: routes.AppLayout, // ابدأ من AppLayout
    routes: [
      GoRoute(
        path: routes.AppLayout, // المسار الرئيسي "/"
        builder: (BuildContext context, GoRouterState state) {
          // ✅ استخدم MultiBlocProvider هنا
          return MultiBlocProvider(
            providers: [
              // يوفر Cubit التنقل لـ AppLayout
              BlocProvider(
                create: (context) => NavigationCubit(),
              ),
              // يوفر Cubit الهوم لـ HomeScreen (عندما يتم عرضها داخل AppLayout)
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
              ),
              // أضف أي BlocProviders أخرى هنا للشاشات الأخرى إذا احتاجت
            ],
            // ابنِ AppLayout كـ child
            child: AppLayout(),
          );
        },
      ),
      // يمكنك ترك هذا المسار إذا كنت تحتاج للوصول لـ HomeScreen مباشرةً في مكان آخر
      // GoRoute(
      //   path: routes.HomeScreen, // اسم المسار القديم
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //       create: (context) => getIt<HomeCubit>(),
      //       child: const HomeScreen(),
      //     );
      //   },
      // ),
    ],
  );
}

