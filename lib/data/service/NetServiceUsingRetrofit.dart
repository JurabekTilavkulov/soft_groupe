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





  @GET('/everything?q=apple')
  Future<ModelNews> appleNews(
      @Query('from') String from,
      @Query('to') String to,
      @Query('sortBy') String sortBy,
      @Query('apiKey') String apiKey
      );

  @GET('/everything?q=tesla')
  Future<ModelNews> teslaNews(
      @Query('sources') String from,
      @Query('sortBy') String sortBy,
      @Query('apiKey') String apiKey,
      );

  @GET('/top-headlines')
  Future<ModelNews> countryNews(
      @Query('country') String country,
      @Query('category') String category,
      @Query('apiKey') String apiKey,
      );

  @GET('/everything?domains=wsj.com')
  Future<ModelNews> techcrunchNews(
      @Query('apiKey') String apiKey,
      );


}