import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          "search"
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height*0.06,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.04),
        margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).width*0.04 ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10, 
          )]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.search,
            color: Colors.black26,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.80,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "search  favorite announce ",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  )
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryList(BuildContext context){
    return Container(
     height: MediaQuery.sizeOf(context).height*0.05,
             margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.01),
             



    );
  }
}