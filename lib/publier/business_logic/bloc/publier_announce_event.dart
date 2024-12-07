import 'package:equatable/equatable.dart';

abstract class PublierAnnonceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PublierAnnonceSubmitted extends PublierAnnonceEvent {
  final String titre;
  final String description;
  final double prix;
  final String image;

  PublierAnnonceSubmitted({required this.titre, required this.description, required this.prix, required this.image});

  @override
  List<Object> get props => [titre, description, prix, image];
}
