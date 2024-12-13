import 'dart:developer';
import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/categories/presentation/widgets/horizontal_categories_widget.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:annonceflash_project/shared/widgets/gap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scrollListener() {
    log('${controller.offset}');
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      log('Load More');
      getIt.get<AnnounceListBloc>().add(
            FetchMoreAnnounceListEvent(
              filter: AnnounceQueryFilter(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Publier une annonce',
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recherche par Catégorie',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.tabsRouter.setActiveIndex(2);
                  },
                  child: const Text('Voir plus'),
                )
              ],
            ),
          ),
          const HorizontalCategoriesWidget(),
          const GapH(20),
          BlocBuilder<AnnounceListBloc, AnnounceListState>(
            builder: (context, state) {
              if (state is FetchAnnounceListFailure &&
                  (state.announces?.data.isEmpty ?? true)) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          getIt.get<AnnounceListBloc>().add(
                                FetchAnnounceListEvent(
                                  filter: AnnounceQueryFilter(
                                    perPage: 50,
                                  ),
                                ),
                              );
                        },
                        label: const Text("Recharger"),
                        icon: const Icon(Icons.refresh),
                      ),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              if (state is FetchAnnounceListLoading &&
                  (state.announces?.data.isEmpty ?? true)) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 30,
                    color: AppColors.primary,
                  ),
                );
              }

              final announces = state.announces?.data;

              if (announces?.isEmpty ?? true) {
                return Center(
                  child: Text(
                    "Aucune annonce pour l'instant",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  GridView.builder(
                    controller: controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: announces!.length,
                    itemBuilder: (context, index) {
                      final announce = announces[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                announce.picture.url.full,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    announce.title,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "${announce.price} Fcfa",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  if (state is FetchMoreAnnounceListLoading) ...[
                    const Center(
                      child: CupertinoActivityIndicator(
                        radius: 40,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
