import 'package:flutter/material.dart';

class AppTheme {
  static const Color mediumGray = Color(0xff7f7f7f);
  static const Color primary = Color(0xff131313);
  static const Color accent = Color(0xff464545);
  static const Color golden = Color(0xffd79e33);
  static const Color white60 = Colors.white60;
  static const Color whiteOpacity45 = Color.fromARGB(45, 255, 255, 255);

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      secondary: accent,
    ),
  );
}

// ignore: slash_for_doc_comments
/**Renaming `clikced` to `golden` would align with the **Single Responsibility Principle (SRP)** and **Clean Code** principles by making the variable name more **descriptive** and **context-independent**.  

### 🔹 **Why is `clikced` better than `golden`?**  
1. **SRP (Single Responsibility Principle)**  
   - The color **should not be tied to a specific action** (like "clikced").  
   - `golden` describes **what the color is**, not **how it’s used**.  

2. **Clean Code (Descriptive Naming)**  
   - `clikced` is **context-dependent** → if you use this color for something else (e.g., a border), the name won’t make sense.  
   - `golden` is **self-explanatory** → makes the code easier to read and maintain.  

3. **Flexibility & Reusability**  
   - If later you decide to use this color for something other than a "golden" state, renaming it now prevents future confusion.  

---

### 🔹 **Refactored Code**
```dart
static const Color golden = Color(0xffd79e33);
```

Now, if you ever change how the color is used, you **don’t need to rename it again**. 🚀  

 */
