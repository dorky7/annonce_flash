import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';

import 'package:annonceflash_project/shared/theme/app_colors.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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
        elevation: 0,
      ),
      body: BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (context, state) {
          if (state is FetchCategoryListLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 30,
                color: AppColors.primary,
              ),
            );
          }
          if (state is FetchCategoryListFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      context.read<CategoryListBloc>().add(
                            FetchCategoryListEvent(),
                          );
                    },
                    label: const Text("Recharger"),
                    icon: const Icon(Icons.refresh),
                  ),
                  Text('${state.message}'),
                ],
              ),
            );
          }
          if (state is FetchCategoryListSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: state.categories?.data.length,
                itemBuilder: (context, index) {
                  final category = state.categories!.data[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
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
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (category.pictureUrl != null)
                                Image.network(
                                  category.pictureUrl!,
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.category,
                                      color: Colors.teal,
                                    );
                                  },
                                )
                              else
                                const Icon(
                                  Icons.category,
                                  color: Colors.teal,
                                ),
                              Text(
                                category.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
