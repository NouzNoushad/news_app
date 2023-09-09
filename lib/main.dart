import 'package:flutter/material.dart';
import 'package:news_app/data/bloc/bloc_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/routes/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp.router(
        routeInformationParser: Routes.router.routeInformationParser,
        routeInformationProvider: Routes.router.routeInformationProvider,
        routerDelegate: Routes.router.routerDelegate,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
