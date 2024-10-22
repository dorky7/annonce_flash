import 'package:annonceflash_project/categories/data/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final CategoryRepository repository;
  CategoryListBloc(this.repository) : super(CategoryListInitial()) {
    on<CategoryListEvent>((event, emit) async {
      try {
        emit(FetchCategoryListLoading());

        final categories = await repository.fetchCategories();

        emit(FetchCategoryListSuccess(categories: categories));
      } catch (e) {
        emit (FetchCategoryListFaillure(message: e.toString()));
      }
    });
  }
}
