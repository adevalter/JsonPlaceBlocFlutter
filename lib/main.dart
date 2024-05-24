import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/bloc/get_post_bloc.dart';
import 'package:grupoestudo/pages/homepage.dart';
import 'package:grupoestudo/repository/api_request_post.dart';

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
        create: (context) => GetPostBloc(ApiRequestPost())
          ..add(GetPostEventFetch(page: 1, maxResults: 10)),
        child: const HomePage(),
      ),
    );
  }
}
