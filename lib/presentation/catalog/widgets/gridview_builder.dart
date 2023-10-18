import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';
import 'package:instrumento/presentation/catalog/widgets/catalog_page_grid.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    super.key,
    required this.data,
    required this.onAddToCart,
    required this.gridCount,
  });

  final List<CategoryType> data;
  final Function(Instrument instrument) onAddToCart;
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: data.map(
        (categoryData) {
          return CatalogPageGrid(
            categoryData: categoryData,
            onAddToCart: onAddToCart,
          );
        },
      ).toList(),
    );
  }
}
