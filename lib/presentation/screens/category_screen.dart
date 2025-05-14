import 'package:flutter/material.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<MenuViewModel>();

    return Scaffold(
      appBar: const RestoAppBar(title: 'Categories'),
      body:
          viewModel.loadingCategories
              ? const Center(child: CircularProgressIndicator())
              : viewModel.categoriesError != null
              ? Center(child: Text(viewModel.categoriesError!))
              : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: viewModel.categories.length,
                itemBuilder: (_, final i) {
                  final c = viewModel.categories[i];

                  return GestureDetector(
                    onTap: () {
                      viewModel
                        ..selectCategory(c.id)
                        ..navigateToMenuListScreen(context, c);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(c.imageUrl, width: 50, height: 50),
                          const SizedBox(height: 8),
                          Text(c.name),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
