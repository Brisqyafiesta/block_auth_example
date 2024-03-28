// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:block_auth_example/auth.bloc/auth_block.dart';
import 'package:block_auth_example/auth.bloc/auth_state.dart';
import 'package:block_auth_example/pages/home_page.dart';
import 'package:block_auth_example/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AuthSuccess) {
            return const HomePage();
          }
          return const LoginPage();
        }),
      ),
    );
  }
}