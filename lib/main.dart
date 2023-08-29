import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

final navigatorState = GlobalKey<NavigatorState>();
final scaffoldState = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorState,
      title: 'Fe Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Scaffold(
            key: scaffoldState,
            backgroundColor: AppColor.color_background,
            body: SafeArea(child: child!));
      },
      initialRoute: Routes.strMainScreen,
      routes: Routes.appRoutes(),
    );
  }
}
