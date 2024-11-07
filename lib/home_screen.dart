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
            hintStyle: TextStyle(color: Colors.white60),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.primary,
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

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: announces!.length,
                  itemBuilder: (context, index) {
                    final announce = announces[index];
                    return Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          announce.picture.url.full,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
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
    );
  }
}
