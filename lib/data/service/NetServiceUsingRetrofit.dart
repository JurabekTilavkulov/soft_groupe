import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/model_news.dart';
//https://newsapi.org/v2/everything?q=apple&from=2024-01-02&to=2024-01-02&sortBy=popularity&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/everything?q=tesla&from=2023-12-03&sortBy=publishedAt&apiKey=57d556b41e0a40169cbecea58e562d76
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=57d556b41e0a40169cbecea58e562d76

part 'NetServiceUsingRetrofit.g.dart';
@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NetWorkService{
  factory NetWorkService(Dio dio,{String baseUrl})=_NetWorkService;


  @GET('/everything?{q}')
  Future<ModelNews?> news(
      @Path('q') String q,
      @Query('apiKey') String apiKey
      );


  @GET('/everything?q=apple&{from}&{to}&sortBy=popularity&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> appleNews(
      @Query('from') String from,
      @Query('to') String to,
      );
//

  @GET('/everything?q=tesla&{from}&sortBy=publishedAt&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> teslaNews(
      @Query('from') String from,
      );

  @GET('/top-headlines?{country}&category=business&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> countryNews(
      @Query('country') String country,
      );

  @GET('/top-headlines?sources=techcrunch&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> techcrunchNews();

  @GET('/everything?domains=wsj.com&apiKey=d4bb802cd5434447a51f0477f58e5e22')
  Future<ModelNews> allNews();
}