// // annonce_page.dart

// import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
// import 'package:annonceflash_project/annonces/presentation/pages/annonce_details_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AnnoncePage extends StatelessWidget {
//   AnnoncePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Annonces'),
//       ),
//       body: BlocBuilder<AnnounceListBloc, AnnounceListState>(
//         builder: (context, state) {
//           if (state is FetchAnnounceListLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is Announce) {
//             return ListView.builder(
//               itemCount: state.annonces.length,
//               itemBuilder: (context, index) {
//                 final annonce = state.annonces[index];
//                 return ListTile(
//                   leading: Image.network(annonce.imageUrl),
//                   title: Text(annonce.titre),
//                   subtitle: Text(annonce.description),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             AnnonceDetailsPage(annonce: annonce),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is AnnonceError) {
//             return Center(child: Text(state.messages));
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
