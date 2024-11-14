import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("categories"),
      ),
      body: BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (context, state) {


     if (state is CategoryListState) {
        getIt.get<CategoryListBloc>().add(FetchCategoryListEvent());
     }else
    if (state is FetchCategoryListLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color:  Colors.amber,
        ),
      );
    }
    
    
    if (state is FetchCategoryListSuccess) {
      return ListView.builder(itemBuilder: (context , index){
        return  ListTile(
          title: Text(state.categories![index].name),
        );
      });
    }
      return Container();
    },
      ),
    );
  }
}