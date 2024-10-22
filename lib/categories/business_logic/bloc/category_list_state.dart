part of 'category_list_bloc.dart';

sealed class CategoryListState extends Equatable {
   final String? message;
   final List<String>? categories;
  const CategoryListState({
    this.categories,
    this.message,
  });
  
  @override
  List<Object> get props => [];
}

final class CategoryListInitial extends CategoryListState {}

final class FetchCategoryListLoading extends CategoryListState{}

final class FetchCategoryListFaillure extends CategoryListState{
  const FetchCategoryListFaillure({required super. message});
}

final class FetchCategoryListSuccess extends CategoryListState{
  const FetchCategoryListSuccess({required super.categories});
}