part of 'category_list_bloc.dart';

sealed class CategoryListState extends Equatable {
  final String? message;
  final List<String>? categories;
  const CategoryListState({
    this.message,
    this.categories,
  });

  @override
  List<Object> get props => [];
}

final class CategoryListInitial extends CategoryListState {}

final class FetchCategoryListLoading extends CategoryListState {}

final class FetchCategoryListsuccess extends CategoryListState {
  const FetchCategoryListsuccess({required super.categories});
}

final class FetchCategoryListFailure extends CategoryListState {
  const FetchCategoryListFailure({required super.message});
}
