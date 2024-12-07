import 'dart:developer';
import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
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
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black12),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<AnnounceListBloc, AnnounceListState>(
        builder: (context, state) {
          if (state is FetchAnnounceListFailure &&
              (state.announces?.data.isEmpty ?? true)) {
            return Center(
              child: TextButton(
                onPressed: () {
                  getIt.get<AnnounceListBloc>().add(
                    FetchAnnounceListEvent(
                      filter: AnnounceQueryFilter(),
                    ),
                  );
                },
                child: Text(
                  state.message,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.red400,
                  ),
                ),
              ),
            );
          }

          if (state is FetchAnnounceListLoading &&
              (state.announces?.data.isEmpty ?? true)) {
            return const Center(child: CupertinoActivityIndicator());
          }

          final announces = state.announces?.data;

          if (announces?.isEmpty ?? true) {
            return Center(
              child: Text(
                'No announce yet',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  controller: controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: announces!.length,
                  itemBuilder: (context, index) {
                    final announce = announces[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "\$${announce.price}",
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
            ),
          );
        },
      ),
    );
  }
}
