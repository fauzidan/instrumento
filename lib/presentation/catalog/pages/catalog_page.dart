import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';
import 'package:instrumento/presentation/cart/pages/cart_page.dart';
import 'package:instrumento/presentation/catalog/widgets/catalog_page_header.dart';
import 'package:instrumento/presentation/catalog/widgets/gridview_builder.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Instrument> cart = [];
  final List<CategoryType> data = storeData;

  @override
  Widget build(BuildContext context) {
    void addToCart(Instrument instrument) {
      cart.add(instrument);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Barang telah ditambahkan ke keranjang!'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    void removeFromCart(String id) {
      cart.removeWhere((element) => element.id == id);
    }

    void pay() {
      cart.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terima Kasih telah belanja di Instrumento!'),
          duration: Duration(seconds: 4),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instrumento',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: cart,
                    onRemoveFromCart: removeFromCart,
                    onPay: pay,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CatalogPageHeader(),
              const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'Produk Kami',
                    style: TextStyle(fontSize: 34, fontFamily: 'Bebas'),
                  ),
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                if(constraints.maxWidth < 800){
                  return GridViewBuilder(data: data, onAddToCart: addToCart, gridCount: 2);
                }else if(constraints.maxWidth < 1200){
                  return GridViewBuilder(data: data, onAddToCart: addToCart, gridCount: 4);
                }else{
                  return GridViewBuilder(data: data, onAddToCart: addToCart, gridCount: 6);
                }
              },)
              // GridViewBuilder(data: data, onAddToCart: addToCart, gridCount: 2),
            ],
          ),
        ),
      ),
    );
  }
}
