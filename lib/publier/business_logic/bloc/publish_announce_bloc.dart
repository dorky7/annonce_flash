import 'package:annonceflash_project/publier/business_logic/bloc/publish_announce_event.dart';
import 'package:annonceflash_project/publier/business_logic/bloc/publish_announce_state.dart';
import 'package:annonceflash_project/publier/data/modele/publish_model.dart';
import 'package:annonceflash_project/publier/data/service/publier_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class PublishAnnonceBloc extends Bloc<PublishAnnonceEvent, PublishAnnonceState> {
  final PublishService _publishService;

  PublishAnnonceBloc(this._publishService) : super(PublishAnnonceInitial() as PublishAnnonceState) {
on<PublishAnnonceSubmitted>((event, emit) async {
  emit(PublishAnnonceLoading());
  try {
    final response = await _publishService.publish(
      PublishModel(
        categoryId: event.categoryId,
        title: event.title,
        description: event.description,
        pictures: event.pictures,
        acceptTerms: event.acceptTerms,
        contactName:event.contactName,
      ),
    );
    emit(PublishAnnonceSuccess(message: 'Annonce publiée avec succès'));
  } catch (e) {
    emit(PublishAnnonceError(errorMessage: e.toString()));
  }
});
  }
}

class PublishAnnonceInitial {
}