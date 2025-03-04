abstract class SVconstants {
  //movieDataBase TMDB
  static final baseUrl = 'https://api.themoviedb.org/3/';
  static final apiKey = 'api_key=36dac39aff2bc256201415d1f2d33cdf';

  static final categoriesURL = '${baseUrl}genre/movie/list?$apiKey';
  static final categoryMoviesUrl =
      '${baseUrl}discover/movie?$apiKey&with_genres=';
  static final popularUrl = '${baseUrl}movie/popular?$apiKey';
  static final searchUrl = '${baseUrl}search/movie?$apiKey&query=';
  static final topRatedUrl = '${baseUrl}movie/top_rated?$apiKey';
  //Firebase
  static final watchListCollectionKey = 'watchList';
}
