import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

class TextStyles {
  static TextStyle bigTitle(double w) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .055,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: AppTheme.accent,
            blurRadius: 2,
            offset: Offset(2, 3),
          ),
        ],
        color: Color.fromARGB(190, 255, 255, 255),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle midTitle(double w) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .04,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: AppTheme.accent,
            blurRadius: 2,
            offset: Offset(2, 3),
          ),
        ],
        color: Color.fromARGB(150, 255, 255, 255),
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
/**
 * According to the **Single Responsibility Principle (SRP)** from SOLID principles, the `AppTheme` class should only be responsible for **theme-related configurations** and should not handle text styles.  

### 🔹 Why?  
Currently, `AppTheme` is doing two things:  
1. **Defining colors & theme settings** (`primary`, `accent`, `theme`).  
2. **Providing text styles** (`bigTitleTS`, `midTitleTS`).  

This violates SRP because the class is handling both **theme management** and **text styling logic**.  

### 🔹 Suggested Refactor:  
To follow SRP, you can separate text styles into a dedicated `TextStyles` class:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313);
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color text = Colors.white60;

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppTheme.primary,
      secondary: AppTheme.accent,
    ),
  );
}

// Separate class for text styles
class TextStyles {
  static TextStyle bigTitle(double w) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .055,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: AppTheme.accent,
            blurRadius: 2,
            offset: Offset(2, 3),
          ),
        ],
        color: Color.fromARGB(190, 255, 255, 255),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle midTitle(double w) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .04,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: AppTheme.accent,
            blurRadius: 2,
            offset: Offset(2, 3),
          ),
        ],
        color: Color.fromARGB(150, 255, 255, 255),
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
```

### 🔹 Benefits of This Refactor:
✅ **Follows SRP** → `AppTheme` only manages theme settings, while `TextStyles` handles text styles.  
✅ **Easier maintenance** → If you want to modify typography, you only need to update `TextStyles`.  
✅ **Improves readability** → Separating concerns makes it clear what each class is responsible for.  

Now, you can use text styles like this:
```dart
Text("Hello World", style: TextStyles.bigTitle(400));
```
 */

/**
 * 

class AppTheme {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313); //#464545
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color text = Colors.white60;
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppTheme.primary,
      secondary: AppTheme.accent,
    ),
  );
  static bigTitleTS({required double w}) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .055,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: AppTheme.accent,
            blurRadius: 2,
            offset: Offset(2, 3),
          )
        ],
        color: Color.fromARGB(190, 255, 255, 255),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static midTitleTS({required double w}) {
    return GoogleFonts.aBeeZee(
        textStyle: TextStyle(
      fontSize: w * .04,
      letterSpacing: 1,
      shadows: [
        BoxShadow(
          color: AppTheme.accent,
          blurRadius: 2,
          offset: Offset(2, 3),
        )
      ],
      color: Color.fromARGB(150, 255, 255, 255),
      fontWeight: FontWeight.w200,
    ));
  }
}
 */
