import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/bloc/get_post_bloc.dart';
import 'package:grupoestudo/homepage.dart';

import 'package:grupoestudo/repostiries/api_request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            GetPostBloc(ApiRequest())..add(GetPostFetchEvent()),
        child: const HomePage(),
      ),
    );
  }
}
/*
 home: BlocProvider(
          create: (context) => GetUserBloc()..add(GetUser()),
          child: const UserPage()),
*/