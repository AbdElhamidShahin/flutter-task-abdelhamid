import 'package:flutter/material.dart';

import '../../../core/networking/category_model.dart';
import '../../../core/networking/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,

      itemBuilder: (context, index) {
        final category = categories[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          child: Padding(
            padding: const EdgeInsets.all(12.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  category.name,

                  style: const TextStyle(
                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                    color: Colors.teal,
                  ),
                ),

                const Divider(height: 20, thickness: 1),

                buildProductsList(category.products),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProductsList(List<ProductModel> products) {
    return ListView.separated(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),

      itemCount: products.length,

      itemBuilder: (context, index) {
        final product = products[index];

        return ListTile(
          contentPadding: EdgeInsets.zero,

          leading: const Icon(Icons.shopping_bag_outlined, color: Colors.amber),

          title: Text(
            product.title,

            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        );
      },

      separatorBuilder: (context, index) =>
          const Divider(indent: 16, endIndent: 16),
    );
  }
}
