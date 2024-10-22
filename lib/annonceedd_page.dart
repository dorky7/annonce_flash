import 'package:flutter/material.dart';

class AnnoncePage extends StatelessWidget {
  const AnnoncePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('annonces'),
        actions: [
          IconButton(onPressed:(){
            print('Notification');
          },
         icon: const Icon(Icons.notifications),
         ),
         IconButton(onPressed: (){
          print('reglages');
         }
         , icon: const Icon(Icons.settings),
         )
        ],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'recherche',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder:(context, index){
              return ListTile(
                title: Text('Annonce ${index +1}'),
                subtitle: Text('Description de l\'annonce ${index +1}'),
                leading: const Icon(Icons.article),
                onTap: (){
                  print('Clic sur Annonce ${index +1}');
                },
              );
            }
            )
            )
          
        ],
      ),
    );
  }
}