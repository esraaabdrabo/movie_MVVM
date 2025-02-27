import 'package:equatable/equatable.dart';
import 'package:mov/widgets/movie_details/language.dart';

class Movies {
  final int page;
  final List<Movie>? results;
  final int totalPages;
  final int totalResults;

  const Movies({
    required this.page,
    this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      page: json["page"],
      results:
          json["results"] == null
              ? null
              : (json["results"] as List)
                  .map((e) => Movie.fromJson(e))
                  .toList(),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    if (results != null)
      data["results"] = results!.map((e) => e.toJson()).toList();
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class Movie extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int>? genreIds;
  final int id;
  final LanguageCode originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"],
      backdropPath: json["backdrop_path"] ?? 'wwemzKWzjKYJFfCeiB57q3r4Bcm.svg',
      genreIds:
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]),
      id: json["id"],
      originalLanguage: LanguageCodeExtension.fromString(
        json["original_language"],
      ),
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}

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
