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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemCount: state.categories?.length,
              itemBuilder: (context, index) {
                final category = state.categories?[index];
                return InkWell(
                  onTap: () {
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.teal,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.category,
                            color: Colors.teal,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              category!.name,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
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
