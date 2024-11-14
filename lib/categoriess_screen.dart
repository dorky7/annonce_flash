import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/categories/presentation/widgets/horizontal_categories_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  final CategoryListBloc bloc;
  final String title;

  const CategoriesScreen({
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
