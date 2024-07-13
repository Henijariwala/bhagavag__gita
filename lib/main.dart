import 'package:bhagavad_gita/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: HomeProvider())],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getThemeData();

      value.changeTheme();
      value.theme = value.isTheme;
      value.isOn == value.theme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
  ));
}
