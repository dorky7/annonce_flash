part of 'country_bloc_bloc.dart';

@immutable
sealed class CountryBlocState {
  final String? messages;
  final List<String>? countries;

  const CountryBlocState({
    this.countries,
    this.messages,
  });
}

final class CountryBlocInitial extends CountryBlocState {}

final class FetchCountryBlocLoading extends CountryBlocState{}

final class FetchCountryBlocFailure extends CountryBlocState{
  const FetchCountryBlocFailure({required super.messages});
}

final class FetchCountryBlocSuccess extends CountryBlocState{
  const FetchCountryBlocSuccess({required super.countries});
}

