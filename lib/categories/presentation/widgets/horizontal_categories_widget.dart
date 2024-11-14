
import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/extensions/string_extensions.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:annonceflash_project/shimmer_container.dart';
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
        if (state.categories?.isNotEmpty ?? false) {
          return Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: (state.categories ?? []).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) {
                    //     return AnnonceDetailsPage(
                    //       annonce: ,
                    //       bloc: AnnonceBloc(
                    //         repository: getIt.get<AnnonceRepository>(),
                    //         filter: AnnonceQueryFilter(
                    //           category: state.categories![index],
                    //         ),
                    //       )..add(GetAnnonceEvents()),
                    //       titre: state.categories![index].capitalize(),
                    //     );
                    //   }),
                    // );
                  },
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
                        state.categories![index].slug.capitalize(),
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
