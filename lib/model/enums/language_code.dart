enum LanguageCode { es, en, hi, ar, fa, fr, unknown }

extension LanguageCodeExtension on LanguageCode {
  String get displayName {
    switch (this) {
      case LanguageCode.es:
        return 'spanish';
      case LanguageCode.en:
        return 'english';
      case LanguageCode.hi:
        return 'hindi';
      case LanguageCode.ar:
        return 'arabic';
      case LanguageCode.fa:
        return 'persian';
      case LanguageCode.fr:
        return 'french';
      case LanguageCode.unknown:
        return '';
    }
  }

  static LanguageCode fromString(String value) {
    switch (value) {
      case 'spanish':
        return LanguageCode.es;
      case 'english':
        return LanguageCode.en;
      case 'hindi':
        return LanguageCode.hi;
      case 'arabic':
        return LanguageCode.ar;
      case 'persian':
        return LanguageCode.fa;
      case 'french':
        return LanguageCode.fr;
      default:
        return LanguageCode.unknown;
    }
  }
}

/**This refactoring **applies multiple SOLID and clean code principles**:  

### ✅ **1️⃣ Single Responsibility Principle (SRP)**
- The `LanguageCode` **enum now represents language codes in a reusable way** instead of being tied to movies.  
- If the app **adds new language-related features (e.g., UI localization, user settings)**, you don’t need to modify unrelated code.  

### ✅ **2️⃣ Open/Closed Principle (OCP)**
- If a **new language** is added, you **extend the enum** without modifying existing logic.  
- The `displayName` getter makes it **easy to add new cases** without touching multiple places in the code.  

### ✅ **3️⃣ Type Safety (Avoids Magic Strings)**
- Instead of relying on **hardcoded language codes** (`'es'`, `'en'`), you now work with **a strongly typed enum**.
- This **reduces errors** (e.g., typos like `'sp'` instead of `'es'` won't break the app).  

### ✅ **4️⃣ Encapsulation & Clean Code**
- **Encapsulates logic** related to language conversion inside the enum + extension.  
- Keeps **logic separate from UI and other business logic**, making it **more modular**.  

---

### **🔹 What Principle Does the Migration from Ternary to Enum Apply?**
✅ **Replacing the long ternary condition with an enum follows the Open/Closed Principle** because:  
- Instead of modifying a **long, hard-to-read ternary condition**, you simply **add a new case in the enum** when needed.  

✅ **It also applies SRP** because:  
- The function originally mixed **language conversion logic** with UI text formatting.  
- Now, **each responsibility is in its own place** (enum for logic, function for formatting).  

---

### 🔥 **Final Thought**
This refactor improves **scalability, maintainability, and reusability** while applying **SRP, OCP, and type safety best practices**. 🚀  
Would you like to refactor more parts of your project using these principles? 😊 */
