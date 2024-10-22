class AnnonceModel {
  final String id;
  final String titre;
  final String description;
  final String imageUrl;
  final double prix;
  final DateTime datePublication;
  final String category;

  AnnonceModel({
    required this.id,
    required this.titre,
    required this.description,
    required this.imageUrl,
    required this.prix,
    required this.datePublication,
    required this.category,
  });

  // Factory method to create an Annonce from a JSON map
  factory AnnonceModel.fromJson(Map<String, dynamic> json) {
    return AnnonceModel(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      prix: (json['prix'] as num).toDouble(),
      datePublication: DateTime.parse(json['datePublication']),
      category: json ['category'],
    );
  }

  // Method to convert Annonce to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'imageUrl': imageUrl,
      'prix': prix,
      'datePublication': datePublication.toIso8601String(),
    };
  }
}
