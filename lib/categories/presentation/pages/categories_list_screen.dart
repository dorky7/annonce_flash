import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/categories/presentation/widgets/horizontal_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListScreen extends StatelessWidget {
  final CategoryListBloc bloc;
  final String title;

  const CategoryListScreen({
    super.key, 
    required this.bloc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const HorizontalCategoriesWidget(
          
        ),
      ),
    );
  }
}
