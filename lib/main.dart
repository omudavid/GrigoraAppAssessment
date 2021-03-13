import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grigora_coding_challenge/logic/home_page_cubit/home_page_cubit.dart';
import 'package:grigora_coding_challenge/repository/providers/data_provider.dart';
import 'package:grigora_coding_challenge/user_interface/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          lazy: false,
          create: (context) => HomePageCubit(
                DataProvider(),
              ),
          child: HomePage()),
    );
  }
}
