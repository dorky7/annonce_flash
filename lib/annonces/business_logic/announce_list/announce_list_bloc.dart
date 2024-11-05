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
            announces: state.announces,
          ),
        );
      }
    });

    on<FetchMoreAnnounceListEvent>((event, emit) async {
      if (state is FetchMoreAnnounceListLoading) {
        return;
      }

      if (state.announces == null) {
        return;
      }

      if (state.announces!.currentPage! >= state.announces!.lastPage!) {
        return;
      }

      try {
        emit(
          FetchMoreAnnounceListLoading(
            announces: state.announces,
          ),
        );

        final filter = AnnounceQueryFilter(
          perPage: state.announces?.perPage ?? 12,
          page: (state.announces?.currentPage ?? 0) + 1,
        );

        final data = await repository.getAnnounces(
          filter: filter,
        );

        final announces = PaginatedData(
          currentPage: data.currentPage,
          perPage: data.perPage,
          to: data.to,
          total: data.total,
          from: data.from,
          lastPage: data.lastPage,
          data: [...state.announces!.data, ...data.data],
        );

        emit(
          FetchAnnounceListSuccess(
            announces: announces,
          ),
        );
      } catch (e) {
        emit(
          FetchMoreAnnounceListFailure(
            message: Utils.extraErrorMessage(e),
            announces: state.announces,
          ),
        );
      }
    });
  }
}
