// // annonce_details_page.dart
// import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
// import 'package:flutter/material.dart';

// class AnnonceDetailsPage extends StatelessWidget {
//   final AnnounceModel annonce;

//   const AnnonceDetailsPage({
//     super.key,
//     required this.annonce,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(annonce.titre),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(annonce.imageUrl),
//             const SizedBox(height: 16.0),
//             Text(
//               annonce.titre,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8.0),
//             Text(annonce.description),
//           ],
//         ),
//       ),
//     );
//   }
// }
