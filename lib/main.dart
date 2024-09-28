import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/provider/provider_app.dart';
import 'package:movies_app/ui/screens/details_screen.dart';
import 'package:movies_app/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(create: (context) => ProviderApp(),child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        // DetailsScreen.routeName: (context) => const DetailsScreen()
      },
    );
  }
}
