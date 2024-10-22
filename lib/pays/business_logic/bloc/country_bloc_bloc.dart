import 'package:annonceflash_project/pays/data/repositories/country_repositiry.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'country_bloc_event.dart';
part 'country_bloc_state.dart';

class CountryBlocBloc extends Bloc<CountryBlocEvent, CountryBlocState> {
  final CountryRepository repository;
  CountryBlocBloc({required this.repository}) : super(CountryBlocInitial()) {
    on<CountryBlocEvent>((event, emit) async{
      try {
        emit(FetchCountryBlocLoading());
        
        final countries = await repository.fetchCountries();

        emit ( FetchCountryBlocSuccess(countries: countries));
      } catch (e) {
        emit (FetchCountryBlocFailure(messages: e.toString()));
      }
    });
  }
}
