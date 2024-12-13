import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/repositories/announce_repository.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AnnounceListScreen extends StatefulWidget {
  final AnnounceQueryFilter filter;
  final String title;

  const AnnounceListScreen({
    required this.filter,
    required this.title,
    super.key,
  });

  @override
  State<AnnounceListScreen> createState() => _AnnounceListScreenState();
}

class _AnnounceListScreenState extends State<AnnounceListScreen> {
  late AnnounceListBloc announceListBloc;

  @override
  void initState() {
    announceListBloc = AnnounceListBloc(
      repository: getIt.get<AnnounceRepository>(),
    )..add(
        FetchAnnounceListEvent(filter: widget.filter),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<AnnounceListBloc, AnnounceListState>(
        bloc: announceListBloc,
        builder: (context, state) {
          if (state is FetchAnnounceListFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      announceListBloc.add(
                        FetchAnnounceListEvent(
                          filter: widget.filter,
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

          if (state is FetchAnnounceListLoading) {
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
                "Aucune annonce pour trouvé",
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            );
          }

          return Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20,
                ),
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
                                style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
