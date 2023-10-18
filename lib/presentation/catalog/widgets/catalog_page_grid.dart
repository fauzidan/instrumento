import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';
import 'package:instrumento/presentation/details/pages/detail_page.dart';

class CatalogPageGrid extends StatelessWidget {
  const CatalogPageGrid({
    super.key,
    required this.categoryData,
    required this.onAddToCart,
  });

  final CategoryType categoryData;
  final Function(Instrument instrument) onAddToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailPage(
            instruments: categoryData.instruments,
            onAddToCart: onAddToCart,
          ),
        ),
      ),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.grey.shade50,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    categoryData.category.text,
                    style: const TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 26,
                    ),
                  ),
                ),
                Image.asset(
                  categoryData.categoryThumb,
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
