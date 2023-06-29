import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_evaluation/pages/home.page.dart';
import 'package:mobile_evaluation/pages/place.page.dart';
import 'package:mobile_evaluation/pages/test.page.dart';
import 'package:mobile_evaluation/providers/places.provider.dart';
import 'package:mobile_evaluation/providers/ui.provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    bool isDarkMode = brightness == Brightness.dark;

    const Color redColour = Color.fromRGBO(160, 24, 24, 1);

    ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromRGBO(219, 11, 33, 1),
        onPrimary: Colors.white,
        secondary: redColour,
        onSecondary: Colors.white,
        error: redColour,
        onError: Colors.white,
        background: redColour,
        onBackground: Colors.white,
        surface: redColour,
        onSurface: Colors.white,
      ),
    );
    ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: redColour,
        unselectedItemColor: Colors.white.withAlpha(150),
        selectedItemColor: Colors.white,
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: redColour,
        onPrimary: Colors.white,
        secondary: redColour,
        onSecondary: Colors.white,
        error: redColour,
        onError: Colors.white,
        background: redColour,
        onBackground: Colors.white,
        surface: redColour,
        onSurface: Colors.white,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Ui()),
        ChangeNotifierProvider(create: (_) => PlacesProvider()),
      ],
      child: MaterialApp(
        title: 'QR Reader',
        initialRoute: "home",
        routes: {
          "home": (_) => const HomePage(),
          "place": (_) => const PlacePage(),
          "test": (_) => const Test()
        },
        theme: !isDarkMode ? darkTheme : lightTheme,
      ),
    );
  }
}
