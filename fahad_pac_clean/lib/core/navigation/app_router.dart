import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fahad_pac_clean/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:fahad_pac_clean/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fahad_pac_clean/features/home/presentation/pages/home_feature_screen.dart';
import 'package:fahad_pac_clean/features/home/presentation/cubit/home_cubit.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          Future.delayed(
            Duration(seconds: 2),
            () => context.mounted ? context.go(Routes.auth) : null,
          );
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Expanded(child: Center(child: Text("splash screen"))),
                  Expanded(child: Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          );
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),
    
  GoRoute(
    path: Routes.home,
    builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
