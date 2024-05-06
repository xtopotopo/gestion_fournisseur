import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/dark_light_mode_controller.dart';
import 'package:get/get.dart';

class Themes{

  static  Color secondaryColor=Get.find<DarkLightModeController>().secondaryColor==Colors.blue?Colors.blue:Colors.green;

  // Light Mode
  static ThemeData lightMode = ThemeData.light().copyWith(

    // Color Sheme
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: Colors.white,
      onBackground: Colors.black,
      primary: Colors.grey[200] as Color,
      onPrimary: Colors.grey[800] as Color,
      secondary: secondaryColor,
      onSecondary: Colors.grey[600] as Color,
      inversePrimary:const Color.fromARGB(49, 42, 55, 60)
    ),

    // Appbar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[600] as Color,
        size: 29
      ),

      titleTextStyle: const TextStyle(
        fontSize: 20, 
        fontWeight: FontWeight.bold, 
        color: Colors.grey
      ),

    ),

    // Texfields Theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey[600] as Color,
          width: 2.0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: secondaryColor,
          width: 2.0,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[600] as Color, 
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      labelStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[600] as Color,
      ),

      floatingLabelStyle: TextStyle(
        fontSize: 16.0,
        color: secondaryColor,
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),

      errorStyle: const TextStyle(color: Colors.red),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),

      prefixIconColor: Colors.grey[600] as Color,
      suffixIconColor: Colors.grey[600] as Color,
      filled: false,
      contentPadding: const EdgeInsets.all(10),

    ),

    // Text Selection Theme
    textSelectionTheme:  TextSelectionThemeData(
      cursorColor: secondaryColor,
      selectionColor:const Color.fromARGB(131, 76, 175, 79),
      selectionHandleColor: secondaryColor,
    ),

    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          secondaryColor
        ),

        foregroundColor:MaterialStateProperty.all<Color>(
          Colors.white
        ), 

        shape:  MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),

        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.w900, 
            color: Colors.white
          ),
        ),

      )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      splashColor: Colors.grey[100],
    )

  );

  // Dark Mode
  static ThemeData darkMode = ThemeData.dark().copyWith(

    // Color Sheme
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: Colors.black,
      onBackground: Colors.white,
      primary: Colors.white10,
      onPrimary: Colors.white70,
      secondary: secondaryColor,
      onSecondary: Colors.grey[400] as Color,
      primaryContainer: const Color.fromARGB(255, 29, 29, 29),
      inversePrimary:const Color.fromARGB(202, 39, 53, 59)

    ),

    // Appbar Theme
    appBarTheme:const AppBarTheme(

      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey,
        size: 29
      ),

      titleTextStyle:  TextStyle(
        fontSize: 20, 
        fontWeight: FontWeight.bold, 
        color: Colors.grey
      ),

    ),

    // Texfields Theme
    inputDecorationTheme: InputDecorationTheme(

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:const BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: secondaryColor,
          width: 2.0,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderSide:const BorderSide(
          color: Colors.grey, 
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      labelStyle:const TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      ),

      floatingLabelStyle: TextStyle(
        fontSize: 16.0,
        color: secondaryColor,
        fontWeight: FontWeight.w700
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),

      errorStyle: const TextStyle(color: Colors.red),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),

      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      filled: false,
      contentPadding: const EdgeInsets.all(10),

    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: secondaryColor,
      selectionColor: const Color.fromARGB(131, 76, 175, 79),
      selectionHandleColor: secondaryColor,
    ),

    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          secondaryColor
        ),

        foregroundColor:MaterialStateProperty.all<Color>(
          Colors.white
        ), 

        shape:  MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),

        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.w900, 
            color: Colors.white
          ),
        ),

      )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.black,
      splashColor: Colors.grey[100],
    )

  );
}