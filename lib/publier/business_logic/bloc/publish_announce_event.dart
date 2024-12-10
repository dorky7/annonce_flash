import 'package:equatable/equatable.dart';

abstract class PublishAnnonceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PublishAnnonceSubmitted extends PublishAnnonceEvent {
  final int categoryId;
  final String title;
  final String description;
  final List<String> pictures;
  final bool acceptTerms;
  final String contactName;


  PublishAnnonceSubmitted({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.acceptTerms,
    required this.pictures,
    required this.contactName,


  });

  @override
  List<Object> get props => [categoryId, title, description, acceptTerms, pictures];
}