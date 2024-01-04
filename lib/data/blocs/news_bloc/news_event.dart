part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
//------------------------------------------------------------------------------
class AppleEvent extends NewsEvent{
  final String from;
  final String to;
  final String sortBy;
  final String apiKey;

  AppleEvent(this.from, this.to, this.sortBy, this.apiKey);
}
//-----------------------------------------------------------------------------
class TeslaEvent extends NewsEvent{}
//------------------------------------------------------------------------------
class CountryEvent extends NewsEvent{
 final String country;
 final String category;
 final String apiKey;

 CountryEvent(this.country, this.category, this.apiKey);
}
//------------------------------------------------------------------------------
class TechEvent extends NewsEvent{}
