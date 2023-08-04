import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './providers/meal_provider.dart';
import './providers/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'api/shared_preference/shared_preference.dart';
import 'database/database_helper.dart';
import 'splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  SharedPreferences sharedPreferennces = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferennces.getString("token")));
  final db = await SqlHelper.db();
  await SqlHelper.createTables(db);
  // runApp(const MyApp("kl"));
}

class MyApp extends StatelessWidget {
  final String? logedin;
  const MyApp(this.logedin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Meals(),
        ),
        ChangeNotifierProvider(create: (_) => Recipes())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          // home: logedin != null ? const Landing() : const Onbording()),
          home: SplashScreen(logedin: logedin,)),
    );
  }
}
