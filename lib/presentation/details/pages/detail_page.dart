import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';
import 'package:instrumento/presentation/details/widgets/detail_page_layer.dart';
import 'package:instrumento/presentation/details/widgets/detail_page_layer_web.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.instruments,
    required this.onAddToCart,
  });

  final List<Instrument> instruments;
  final Function(Instrument instrument) onAddToCart;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 28,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 700) {
                    return PageView.builder(
                      itemCount: instruments.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return DetailPageLayer(
                          instrument: instruments[index],
                          onAddToCart: onAddToCart,
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: instruments.length,
                      itemBuilder: (context, index) {
                        return DetailPageLayerWeb(
                          instrument: instruments[index],
                          onAddToCart: onAddToCart,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
