import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/repositories/announce_repository.dart';
import 'package:annonceflash_project/shared/models/paginated_data.dart';
import 'package:annonceflash_project/shared/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'announce_list_event.dart';
part 'announce_list_state.dart';

class AnnounceListBloc extends Bloc<AnnounceListEvent, AnnounceListState> {
  final AnnounceRepository repository;
  AnnounceListBloc({
    required this.repository,
  }) : super(AnnounceListInitial()) {
    on<FetchAnnounceListEvent>((event, emit) async {
      try {
        emit(
          FetchAnnounceListLoading(
            announces: state.announces,
          ),
        );

        final announces = await repository.getAnnounces(
          filter: event.filter,
        );

        emit(
          FetchAnnounceListSuccess(
            announces: announces,
          ),
        );
      } catch (e) {
        emit(
          FetchAnnounceListFailure(
            message: Utils.extraErrorMessage(e),
          ),
        );
      }
    });
  }
}
