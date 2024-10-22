part of 'country_bloc_bloc.dart';

@immutable
sealed class CountryBlocEvent {}

final class FetchCountryListEvent extends CountryBlocEvent{}