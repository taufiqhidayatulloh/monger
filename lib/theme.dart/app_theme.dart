import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1555FB);

  ThemeData getThemeApp() {
    return ThemeData(
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a purple toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      colorScheme: const ColorScheme.light(
          primary: Color(0xFF1555FB),
          error: Color(0xFFEE0B0B),
          shadow: Color(0xFF121212),
          inversePrimary: Color(0xFFFFFFFF)),
      fontFamily: 'PlusJakartaSans',
      // useMaterial3: true,
    );
  }
}
