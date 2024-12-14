import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:annonceflash_project/shimmer_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalCategoriesWidget extends StatelessWidget {
  const HorizontalCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder: (context, state) {
        if (state is FetchCategoryListLoading) {
          return Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(6, (e) {
                return ShimmerContainer(
                  child: Container(
                    width: 80,
                    height: double.infinity,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }

        if (state.categories?.data.isNotEmpty ?? false) {
          return Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: (state.categories?.data ?? []).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final category = state.categories!.data[index];
                return InkWell(
                  onTap: () {
                    context.router.push(
                      AnnounceListRoute(
                        filter: AnnounceQueryFilter(
                          op: 'similar',
                          postId: category.id,
                        ),
                        title: category.name,
                      ),
                    );
                  },
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        state.categories!.data[index].name,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
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
    );
  }
}
