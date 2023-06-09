import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screening_stage_two_app/core/constants/constants.dart';
import 'package:screening_stage_two_app/features/user_profiles/presentation/pages/user_profiles.dart';
import 'core/dark_theme/provider/dark_theme_provider.dart';
import 'core/styles/styles.dart';
import 'features/display_counter_value/presentation/pages/display_counter.dart';
import 'features/number_counter/presentation/pages/numbercounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            routes: <String, WidgetBuilder>{
              HOME: (BuildContext context) => NumberCounter(),
              DISPLAY_COUNTER: (BuildContext context) => DsiplayCounterValue(),
              USER_PROFILES: (BuildContext context) => UserProfiles(),
            },
          );
        },
      ),
    );
  }
}