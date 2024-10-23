import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/repositories/annoce_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'annonce_event.dart';
part 'annonce_state.dart';

class AnnonceBloc extends Bloc<AnnonceEvent, AnnonceState> {
  final AnnonceRepository repository;
  final AnnonceQueryFilter filter;

  AnnonceBloc({
    required this.repository,
    required this.filter,
  }) : super(AnnonceInitial()) {
    on<fetchAnnonces>((event, emit) async {
      emit(AnnonceLoading());
      try {
        final annonces = await repository.getAnnonces(
          filter: filter,
        );
        emit(AnnonceLoaded(annonces));
      } catch (e) {
        emit(AnnonceError(e.toString()));
      }
    });
  }
}
