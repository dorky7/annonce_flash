import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key, required this.bloc});
  final CategoryListBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: AppColors.gray100,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (context, state){
          if (state is FetchCategoryListLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is FetchCategoryListSuccess){
            return ListView.builder(
              itemCount: state.categories!.length,
              itemBuilder:(context, index){
                return ListTile(
                  title: Text(state.categories![index]),
                );
              },
             );
          } else if (state is FetchCategoryListFaillure){
            return Center(
              child: Text(state.message ?? ''),
            );
          }
          return Container();

        },
      )
    );
  }
}