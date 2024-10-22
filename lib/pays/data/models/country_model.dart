class Country {
  final String name;
  final String code;
  final String capital;
  final int population;

  Country({
    required this.name,
    required this.code,
    required this.capital,
    required this.population,
  });

  // Méthode pour convertir un objet JSON en instance de Country
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      capital: json['capital'],
      population: json['population'],
    );
  }

  // Méthode pour convertir une instance de Country en objet JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'capital': capital,
      'population': population,
    };
  }
}
