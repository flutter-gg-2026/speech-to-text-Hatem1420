import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fahad_pac_clean/features/auth/presentation/cubit/auth_cubit.dart';

class AuthFeatureScreen extends StatelessWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
