import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/home_screen.dart';
import 'package:provider_statemanagement/provider/auth_provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';
import 'package:provider_statemanagement/provider/exampule_one_provider.dart';
import 'package:provider_statemanagement/provider/favourite_provider.dart';
import 'package:provider_statemanagement/provider/theme_changer_provider.dart';
import 'package:provider_statemanagement/screen/Login_api_provider.dart';
import 'package:provider_statemanagement/screen/dark_theme.dart';
import 'package:provider_statemanagement/screen/exampule_one.dart';
import 'package:provider_statemanagement/screen/favourite/favourite_screen.dart';
import 'package:provider_statemanagement/screen/provider_stateless_use.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItem()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
          builder:(BuildContext context){
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.tealAccent
                ),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.pink,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.purple
                ),
              ),
              home: LoginApiScreen(),
            );
          }
      )
    );
  }
}
