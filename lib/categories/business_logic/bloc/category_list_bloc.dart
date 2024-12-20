import 'package:annonceflash_project/categories/data/model/category_model.dart';
import 'package:annonceflash_project/categories/data/reposetories/category_repository.dart';
import 'package:annonceflash_project/shared/models/paginated_data.dart';
import 'package:annonceflash_project/shared/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final CategoryRepository repository;
  CategoryListBloc({required this.repository}) : super(CategoryListInitial()) {
    on<FetchCategoryListEvent>((event, emit) async {
      try {
        emit(FetchCategoryListLoading());

        final categories = await repository.fetchCategories();

        emit(FetchCategoryListSuccess(categories: categories));
      } catch (e) {
        emit(
          FetchCategoryListFailure(
            message: Utils.extraErrorMessage(e),
          ),
        );
      }
    });
  }
}
