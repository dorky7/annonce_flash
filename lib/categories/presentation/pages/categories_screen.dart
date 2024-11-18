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
        title: const Text("Catégories"),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (context, state) {
          if (state is CategoryListInitial) {
            getIt.get<CategoryListBloc>().add(FetchCategoryListEvent());
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else if (state is FetchCategoryListLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else if (state is FetchCategoryListSuccess) {
            return ListView.builder(
              itemCount: state.categories?.length,
              itemBuilder: (context, index) {
                final category = state.categories?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.category,
                        color: Colors.teal,
                      ),
                      title: Text(
                        category!.name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                      ),
                      onTap: () {
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is FetchCategoryListFaillure) {
            return Center(child: Text(state.message!));
          }
          return Container();
        },
      ),
    );
  }
}
