part of 'category_list_bloc.dart';

sealed class CategoryListState extends Equatable {
  final PaginatedData<CategoryModel>? categories;
  final String? message;

  const CategoryListState({
    this.categories,
    this.message,
  });

  @override
  List<Object?> get props => [categories, message];
}

final class CategoryListInitial extends CategoryListState {}

final class FetchCategoryListLoading extends CategoryListState {}

final class FetchCategoryListFailure extends CategoryListState {
  const FetchCategoryListFailure({
    required super.message,
    super.categories,
  });
}

final class FetchCategoryListSuccess extends CategoryListState {
  const FetchCategoryListSuccess({
    required super.categories,
  });
}
