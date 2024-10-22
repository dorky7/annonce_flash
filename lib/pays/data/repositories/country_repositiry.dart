import 'package:annonceflash_project/pays/data/models/country_model.dart';


class CountryRepository {
  final List<Country> countries = [];

  List<Country> getAllCountries() {
    return countries;
  }

  void addCountry(Country country) {
    countries.add(country);
  }

  void updateCountry(Country updatedCountry) {
    final index = countries.indexWhere((country) => country.code == updatedCountry.code);
    if (index != -1) {
      countries[index] = updatedCountry;
    }
  }

  void deleteCountry(String code) {
    countries.removeWhere((country) => country.code == code);
  }

  fetchCountries() {}
}
