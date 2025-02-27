import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313);
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color white60 = Colors.white60;
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyThemeData.primary,
      secondary: MyThemeData.accent,
    ),
  );
}

/**Renaming `golden` to `golden` would align with the **Single Responsibility Principle (SRP)** and **Clean Code** principles by making the variable name more **descriptive** and **context-independent**.  

### 🔹 **Why is `golden` better than `golden`?**  
1. **SRP (Single Responsibility Principle)**  
   - The color **should not be tied to a specific action** (like "golden").  
   - `golden` describes **what the color is**, not **how it’s used**.  

2. **Clean Code (Descriptive Naming)**  
   - `golden` is **context-dependent** → if you use this color for something else (e.g., a border), the name won’t make sense.  
   - `golden` is **self-explanatory** → makes the code easier to read and maintain.  

3. **Flexibility & Reusability**  
   - If later you decide to use this color for something other than a "golden" state, renaming it now prevents future confusion.  

---

### 🔹 **Refactored Code**
```dart
static const Color golden = Color(0xffd79e33);
```

Now, if you ever change how the color is used, you **don’t need to rename it again**. 🚀  

Would you like me to check other variable names for better readability? 😊 */
class TextStyles {
  static TextStyle bigTitle(double w) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .055,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: MyThemeData.accent,
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
            color: MyThemeData.accent,
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
 * According to the **Single Responsibility Principle (SRP)** from SOLID principles, the `MyThemeData` class should only be responsible for **theme-related configurations** and should not handle text styles.  

### 🔹 Why?  
Currently, `MyThemeData` is doing two things:  
1. **Defining colors & theme settings** (`primary`, `accent`, `theme`).  
2. **Providing text styles** (`bigTitleTS`, `midTitleTS`).  

This violates SRP because the class is handling both **theme management** and **text styling logic**.  

### 🔹 Suggested Refactor:  
To follow SRP, you can separate text styles into a dedicated `TextStyles` class:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313);
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color text = Colors.white60;

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyThemeData.primary,
      secondary: MyThemeData.accent,
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
            color: MyThemeData.accent,
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
            color: MyThemeData.accent,
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
✅ **Follows SRP** → `MyThemeData` only manages theme settings, while `TextStyles` handles text styles.  
✅ **Easier maintenance** → If you want to modify typography, you only need to update `TextStyles`.  
✅ **Improves readability** → Separating concerns makes it clear what each class is responsible for.  

Now, you can use text styles like this:
```dart
Text("Hello World", style: TextStyles.bigTitle(400));
```
 */

/**
 * 

class MyThemeData {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313); //#464545
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color text = Colors.white60;
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyThemeData.primary,
      secondary: MyThemeData.accent,
    ),
  );
  static bigTitleTS({required double w}) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        fontSize: w * .055,
        letterSpacing: 1,
        shadows: [
          BoxShadow(
            color: MyThemeData.accent,
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
          color: MyThemeData.accent,
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
