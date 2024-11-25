import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.black),
            overlayColor:
                WidgetStatePropertyAll(Colors.black.withOpacity(0.2))),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 3),
          ),
          labelStyle: TextStyle(color: Colors.blue)),
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      colorScheme: const ColorScheme.light().copyWith(
        secondary: Colors.blueAccent[100],
        surface: Colors.blueAccent[100],
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueAccent[100],
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      listTileTheme: const ListTileThemeData(textColor: Colors.black),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[100],
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent[100],
          foregroundColor: Colors.black),
      cardTheme: CardTheme(
        color: Colors.blueAccent[100],
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.blue;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.black;
          }
          return Colors.white;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent[100], // Cor de fundo
          foregroundColor: Colors.black,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      primaryTextTheme: const TextTheme(),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.grey[100],
        titleTextStyle: const TextStyle(color: Colors.amber),
        contentTextStyle: const TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, unselectedItemColor: Colors.white),
      datePickerTheme: DatePickerThemeData(
        todayBorder: const BorderSide(color: Colors.blue),
        todayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blue[800];
            }
            return Colors.white;
          },
        ),
        todayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return Colors.grey;
          },
        ),
        dayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return Colors.black;
          },
        ),
        dayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blueAccent;
            }
            return Colors.white;
          },
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.blue),
      drawerTheme: DrawerThemeData(
          backgroundColor: Colors.grey[800]) //ajustar cor para tema claro,
      );
}

ThemeData buildDarkTheme() {
  return ThemeData(
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            overlayColor:
                WidgetStatePropertyAll(Colors.white.withOpacity(0.2))),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          labelStyle: TextStyle(color: Colors.blueGrey[100])),
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.blueGrey[100],
        surface: Colors.blueGrey[100],
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[800],
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      listTileTheme: const ListTileThemeData(textColor: Colors.white),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueGrey[100],
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey[400], foregroundColor: Colors.white),
      cardTheme: CardTheme(
        color: Colors.blueGrey[400],
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.black;
          }
          return Colors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.brown;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[700],
          foregroundColor: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      primaryTextTheme: const TextTheme(),
      dialogTheme: DialogTheme(
        // iconColor: Colors.amber,
        // barrierColor: Colors.amber,
        surfaceTintColor: Colors.amber,
        backgroundColor: Colors.grey[700],
        titleTextStyle: const TextStyle(color: Colors.black),
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blueGrey[700],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black),
      datePickerTheme: DatePickerThemeData(
        confirmButtonStyle: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white)),
        cancelButtonStyle: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white)),
        backgroundColor: Colors.blueGrey[400],
        todayBorder: const BorderSide(color: Colors.blueGrey),
        todayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blueGrey[700];
            }
            return Colors.white;
          },
        ),
        todayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.black;
            }
            return Colors.blueGrey[400];
          },
        ),
        dayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.grey;
            }
            return Colors.white;
          },
        ),
        dayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return Colors.blueGrey[400];
          },
        ),
      ),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: Colors.blueGrey[900]),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]));
}
