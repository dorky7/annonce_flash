import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.bloc,
  });
  final AnnounceListBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AnnounceListBloc, AnnounceListState>(
        builder: (context, state) {
          if (state is FetchAnnounceListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchAnnounceListSuccess) {
            final List<AnnounceModel> announceList = state.announces!.data;
            return ListView.builder(
              itemCount: announceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(announceList[index].title),
                );
              },
            );
          } else if (state is FetchAnnounceListFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
