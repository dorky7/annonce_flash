// // annonce_page.dart

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
//       body: BlocBuilder<AnnonceBloc, AnnonceState>(
//         builder: (context, state) {
//           if (state is AnnonceLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is AnnonceLoaded) {
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
