abstract class SVconstants {
  //movieDataBase TMDB
  static var baseUrl = 'https://api.themoviedb.org/3/';
  static var apiKey = 'api_key=36dac39aff2bc256201415d1f2d33cdf';

  static var categoriesURL = '${baseUrl}genre/movie/list?$apiKey';
  static var categoryMoviesUrl =
      '${baseUrl}discover/movie?$apiKey&with_genres=';
  static var popularUrl = '${baseUrl}movie/popular?$apiKey';
  static var searchUrl = '${baseUrl}search/movie?$apiKey&query=';
  static var topRatedUrl = '${baseUrl}movie/top_rated?$apiKey';
//Firebase
  static var watchListCollectionKey = 'watchList';
}
